//
//  FrameExampleAnimatedView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleAnimatedView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleAnimatedView ()

@property (nonatomic, strong) NSMutableArray *animatableConstraints;
@property (nonatomic, assign) int padding;
@property (nonatomic, assign) BOOL animating;

@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;


@end

@implementation FrameExampleAnimatedView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;

    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    self.greenView = greenView;
    

    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    self.redView = redView;
    

    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    self.blueView = blueView;
    
    
    int padding = self.padding = 10;

    [self layoutViewWithPadding:padding];
    return self;
}

- (void)layoutViewWithPadding:(CGFloat)padding {
    CGFloat small_width = (self.tp_width - padding * 3) / 2;
    CGFloat large_width = (self.tp_width - padding *2);
    CGFloat height = (self.tp_height - padding * 3) / 2;
    
    self.greenView.tp_size = CGSizeMake(small_width, height);
    self.greenView.tp_top = padding;
    self.greenView.tp_left = padding;
    
    self.redView.tp_size = CGSizeMake(small_width, height);
    self.redView.tp_top = padding;
    [self.redView rightToViewRight:self offset:-padding fixedSize:YES];
    
    self.blueView.tp_size = CGSizeMake(large_width, height);
    [self.blueView topToViewBottom:self.greenView offset:padding fixedSize:YES];
    [self.blueView leftToViewLeft:self offset:padding fixedSize:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutViewWithPadding:self.padding];
}

- (void)didMoveToWindow {
    [self layoutIfNeeded];

    if (self.window) {
        self.animating = YES;
        [self animateWithInvertedInsets:NO];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    self.animating = newWindow != nil;
}

- (void)animateWithInvertedInsets:(BOOL)invertedInsets {
    if (!self.animating) return;

    int padding = invertedInsets ? 100 : 10;
    self.padding = padding;
    
    [UIView animateWithDuration:1 animations:^{
        [self layoutViewWithPadding:padding];
    } completion:^(BOOL finished) {
        //repeat!
        [self animateWithInvertedInsets:!invertedInsets];
    }];
}


@end

