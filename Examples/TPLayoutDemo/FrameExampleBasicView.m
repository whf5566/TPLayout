//
//  FrameExampleBasicView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleBasicView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleBasicView()
@property (nonatomic, strong) UIView *greenView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *blueView;
@end

@implementation FrameExampleBasicView

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
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIView *superview = self;
    int padding = 10;
    
    CGFloat width = (superview.tp_width - padding * 3) / 2;
    CGFloat height = (superview.tp_height - padding * 3) / 2;
    self.greenView.tp_top = padding;
    self.greenView.tp_left = padding;
    self.greenView.tp_size = CGSizeMake(width, height);
    
    self.redView.tp_top = padding;
    self.redView.tp_left = self.greenView.tp_right + padding;
    self.redView.tp_rightResize = superview.tp_width - padding;
    self.redView.tp_bottomResize = self.greenView.tp_bottom;
    
    [self.blueView topToViewBottom:self.greenView offset:padding fixedSize:NO];
    [self.blueView leftToViewLeft:superview offset:padding fixedSize:NO];
    [self.blueView rightToViewRight:superview offset:-padding fixedSize:NO];
    [self.blueView bottomToViewBottom:superview offset:-padding fixedSize:NO];
}


@end
