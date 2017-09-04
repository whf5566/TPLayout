//
//  MASExampleMarginView.m
//  Masonry iOS Examples
//
//  Created by Craig Siemens on 2015-02-23.
//  Copyright (c) 2015 Jonas Budelmann. All rights reserved.
//

#import "MASExampleMarginView.h"
#import <TPLayout/TPLayout.h>

@implementation MASExampleMarginView

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *lastView = self;
    for (int i = 0; i < 10; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        view.layoutMargins = UIEdgeInsetsMake(5, 10, 15, 20);
        [self addSubview:view];
        
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(lastView.topMargin);
//            make.bottom.equalTo(lastView.bottomMargin);
//            make.left.equalTo(lastView.leftMargin);
//            make.right.equalTo(lastView.rightMargin);
//        }];
        view.al_top.equal(lastView.al_topMargin);
        view.al_bottom.equal(lastView.al_bottomMargin);
        view.al_left.equal(lastView.al_leftMargin);
        view.al_right.equal(lastView.al_rightMargin);
        
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
