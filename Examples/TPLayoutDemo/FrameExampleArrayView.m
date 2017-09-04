//
//  FrameExampleArrayView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleArrayView.h"
#import <TPLayout/TPLayout.h>

static CGFloat const kArrayExampleIncrement = 10.0;

@interface FrameExampleArrayView ()

@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) NSArray *buttonViews;

@end

@implementation FrameExampleArrayView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    UIButton *raiseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [raiseButton setTitle:@"Raise" forState:UIControlStateNormal];
    [raiseButton addTarget:self action:@selector(raiseAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:raiseButton];
    
    UIButton *centerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [centerButton setTitle:@"Center" forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:centerButton];

    UIButton *lowerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [lowerButton setTitle:@"Lower" forState:UIControlStateNormal];
    [lowerButton addTarget:self action:@selector(lowerAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:lowerButton];
    
    lowerButton.tp_size = CGSizeMake(100, 20);
    lowerButton.tp_left = 10;
    lowerButton.tp_centerY = self.tp_height / 2;
    lowerButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    
    centerButton.tp_size = CGSizeMake(100, 20);
    [centerButton centerInView:self];
    centerButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    raiseButton.tp_size = CGSizeMake(100, 20);
    [raiseButton rightToViewRight:self offset:-10 fixedSize:YES];
    raiseButton.tp_centerY = self.tp_height / 2;
    raiseButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    self.buttonViews = @[ raiseButton, lowerButton, centerButton ];
    
    return self;
}

- (void)centerAction {
    self.offset = 0.0;
}

- (void)raiseAction {
    self.offset -= kArrayExampleIncrement;
}

- (void)lowerAction {
    self.offset += kArrayExampleIncrement;
}

- (void)setOffset:(CGFloat)offset {
    _offset = offset;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    for (UIView *view in self.buttonViews) {
        [view centerYToView:self offset:self.offset];
    }
}

@end
