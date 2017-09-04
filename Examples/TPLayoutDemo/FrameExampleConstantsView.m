//
//  FrameExampleConstantsView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleConstantsView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleConstantsView ()
@property (nonatomic, strong) UIView *purpleView;
@property (nonatomic, strong) UIView *orangeView;

@end

@implementation FrameExampleConstantsView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    UIView *purpleView = UIView.new;
    purpleView.backgroundColor = UIColor.purpleColor;
    purpleView.layer.borderColor = UIColor.blackColor.CGColor;
    purpleView.layer.borderWidth = 2;
    [self addSubview:purpleView];
    self.purpleView = purpleView;
    
    UIView *orangeView = UIView.new;
    orangeView.backgroundColor = UIColor.orangeColor;
    orangeView.layer.borderColor = UIColor.blackColor.CGColor;
    orangeView.layer.borderWidth = 2;
    [self addSubview:orangeView];
    self.orangeView = orangeView;
    
    [self layoutViews];
    
    return self;
}

- (void)layoutViews {
    [self.purpleView topToViewTop:self offset:20 fixedSize:NO];
    [self.purpleView leftToViewLeft:self offset:20 fixedSize:NO];
    [self.purpleView bottomToViewBottom:self offset:-20 fixedSize:NO];
    [self.purpleView rightToViewRight:self offset:-20 fixedSize:NO];
    
    [self.orangeView centerToView:self offsetSize:CGSizeMake(0, 50)];
    self.orangeView.tp_size = CGSizeMake(200, 100);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutViews];
}

@end
