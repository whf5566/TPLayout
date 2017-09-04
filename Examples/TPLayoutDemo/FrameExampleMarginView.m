//
//  FrameExampleMarginView.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleMarginView.h"
#import <TPLayout/TPLayout.h>

@implementation FrameExampleMarginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    UIView *lastView = self;
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        view.layoutMargins = UIEdgeInsetsMake(5, 10, 15, 20);
        [self addSubview:view];
        if (i == 0) {
            [view edgesToView:lastView offsetEdge:UIEdgeInsetsMake(0, 20, 0, 20)];
        } else {
            [view edgesToView:lastView offsetEdge:UIEdgeInsetsMake(5, 10, 15, 20)];
        }
        
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        lastView = view;
    }
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
