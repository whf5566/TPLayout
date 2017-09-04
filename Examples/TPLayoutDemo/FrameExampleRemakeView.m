//
//  FrameExampleRemakeView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleRemakeView.h"
#import <TPLayout/TPLayout.h>

@interface FrameExampleRemakeView ()

@property (nonatomic, strong) UIButton *movingButton;
@property (nonatomic, assign) BOOL topLeft;

- (void)toggleButtonPosition;

@end

@implementation FrameExampleRemakeView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    self.movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingButton setTitle:@"Move Me!" forState:UIControlStateNormal];
    self.movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    
    [self.movingButton addTarget:self action:@selector(toggleButtonPosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingButton];
    
    self.topLeft = YES;
    
    self.movingButton.tp_size = CGSizeMake(100, 100);
    [self.movingButton leftToViewLeft:self offset:10 fixedSize:YES];
    [self.movingButton topToViewTop:self offset:10 fixedSize:YES];
    
    return self;
}

- (void)toggleButtonPosition {
    self.topLeft = !self.topLeft;
    
    [UIView animateWithDuration:0.4 animations:^{
        if (self.topLeft) {
            [self.movingButton leftToViewLeft:self offset:10 fixedSize:YES];
            [self.movingButton topToViewTop:self offset:10 fixedSize:YES];
            self.movingButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        } else {
            [self.movingButton rightToViewRight:self offset:-10 fixedSize:YES];
            [self.movingButton bottomToViewBottom:self offset:-10 fixedSize:YES];
            self.movingButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        }
    }];
}

@end
