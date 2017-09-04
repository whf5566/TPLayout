//
//  FrameExampleUpdateView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//
#import "FrameExampleUpdateView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleUpdateView ()

@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGSize buttonSize;

@end

@implementation FrameExampleUpdateView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingButton setTitle:@"Grow Me!" forState:UIControlStateNormal];
    self.growingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingButton.layer.borderWidth = 3;

    [self.growingButton addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.growingButton];

    self.buttonSize = CGSizeMake(100, 100);
    
    self.growingButton.tp_size = self.buttonSize;
    [self.growingButton centerToView:self offsetSize:CGSizeMake(0, 0)];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = MIN(self.tp_width, self.buttonSize.width);
    CGFloat height = MIN(self.tp_height,self.buttonSize.height);
    self.growingButton.tp_size = CGSizeMake(width, height);
    [self.growingButton centerToView:self offsetSize:CGSizeMake(0, 0)];
}

- (void)didTapGrowButton:(UIButton *)button {
    CGFloat width = MIN(self.tp_width, self.buttonSize.width * 1.3);
    CGFloat height = MIN(self.tp_height,self.buttonSize.height * 1.3);

    self.buttonSize = CGSizeMake(width,height);
    [UIView animateWithDuration:0.4 animations:^{
        self.growingButton.tp_size = self.buttonSize;
        [self.growingButton centerToView:self offsetSize:CGSizeMake(0, 0)];
    }];
}

@end
