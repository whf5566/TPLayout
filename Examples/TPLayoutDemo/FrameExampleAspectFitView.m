//
//  FrameExampleAspectFitView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//
#import "FrameExampleAspectFitView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleAspectFitView ()
@property UIView *topView;
@property UIView *topInnerView;
@property UIView *bottomView;
@property UIView *bottomInnerView;
@end

@implementation FrameExampleAspectFitView

// Designated initializer
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Create views
        self.topView = [[UIView alloc] initWithFrame:CGRectZero];
        self.topInnerView = [[UIView alloc] initWithFrame:CGRectZero];
        self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
        self.bottomInnerView = [[UIView alloc] initWithFrame:CGRectZero];
        
        // Set background colors
        UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
        [self.topView setBackgroundColor:blueColor];

        UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
        [self.topInnerView setBackgroundColor:lightGreenColor];

        UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
        [self.bottomView setBackgroundColor:pinkColor];
        
        UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
        [self.bottomInnerView setBackgroundColor:darkGreenColor];
        
        // Layout top and bottom views to each take up half of the window
        [self addSubview:self.topView];
        [self addSubview:self.bottomView];
        
        // Inner views are configured for aspect fit with ratio of 3:1
        [self.topView addSubview:self.topInnerView];
        [self.bottomView addSubview:self.bottomInnerView];
        
        [self layoutView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self layoutView];
}

- (void)layoutView {
    self.topView.tp_width = self.tp_width;
    self.topView.tp_height = self.tp_height / 2;
    [self.topView leftToViewLeft:self offset:0 fixedSize:NO];
    [self.topView topToViewTop:self offset:0 fixedSize:NO];
    
    self.bottomView.tp_width = self.tp_width;
    self.bottomView.tp_height = self.tp_height / 2;
    [self.bottomView bottomToViewBottom:self offset:0 fixedSize:YES];
    [self.bottomView leftToViewLeft:self offset:0 fixedSize:YES];
    
    self.topInnerView.tp_width = MIN(self.topView.tp_width,  self.topView.tp_height * 3);
    self.topInnerView.tp_height = MIN(self.topInnerView.tp_width / 3, self.topView.tp_height);
    [self.topInnerView centerToView:self.topView offsetSize:CGSizeZero];
    
    self.bottomInnerView.tp_height = MIN(self.bottomView.tp_height,self.bottomView.tp_width * 3);
    self.bottomInnerView.tp_width = MIN(self.bottomInnerView.tp_height / 3,self.bottomView.tp_width);
    [self.bottomInnerView centerToView:self.bottomView offsetSize:CGSizeZero];
}

@end
