//
//  MASExampleLayouGuideView.m
//  TPLayoutDemo
//
//  Created by weihuafeng on 2017/9/20.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "MASExampleLayouGuideView.h"
#import <TPLayout/TPLayout.h>

@interface MASExampleLayouGuideView ()
@property (nonatomic, strong) UILayoutGuide *layoutGuide1;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UILayoutGuide *layoutGuide2;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UILayoutGuide *layoutGuide3;
@property (nonatomic, strong) UIButton *button;
@end


@implementation MASExampleLayouGuideView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}


- (void)setupViews {
    
    UILayoutGuide *layoutGuide1 = [[UILayoutGuide alloc] init];
    [self addLayoutGuide:layoutGuide1];
    self.layoutGuide1 = layoutGuide1;
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = self.randomColor;
    [self addSubview:view1];
    self.view1 = view1;
    
    UILayoutGuide *layoutGuide2 = [[UILayoutGuide alloc] init];
    [self addLayoutGuide:layoutGuide2];
    self.layoutGuide2 = layoutGuide2;
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = self.randomColor;
    [self addSubview:view2];
    self.view2 = view2;
    
    UILayoutGuide *layoutGuide3 = [[UILayoutGuide alloc] init];
    [self addLayoutGuide:layoutGuide3];
    self.layoutGuide3 = layoutGuide3;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"animate for layoutGuide" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(animateLayoutGuide) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [self.randomColor colorWithAlphaComponent:0.3];
    [self addSubview:button];
    self.button = button;
    
    layoutGuide1.al_left.equal(self);
    layoutGuide1.al_height.equal(layoutGuide1.al_width);
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
    if (@available(iOS 11.0, *)) {
        layoutGuide1.al_centerY.equal(self.safeAreaLayoutGuide);
    } else {
        layoutGuide1.al_centerY.equal(self);
    }
#else
    layoutGuide1.al_centerY.equal(self);
#endif
    
    view1.al_left.equal(layoutGuide1.al_right);
    view1.al_size.equal(layoutGuide1);
    view1.al_centerY.equal(layoutGuide1);
    
    layoutGuide2.al_left.equal(view1.al_right);
    layoutGuide2.al_size.equal(layoutGuide1);
    layoutGuide2.al_centerY.equal(layoutGuide1);
    
    view2.al_left.equal(layoutGuide2.al_right);
    view2.al_size.equal(layoutGuide1);
    view2.al_centerY.equal(layoutGuide1);
    
    layoutGuide3.al_left.equal(view2.al_right);
    layoutGuide3.al_right.equal(self.al_right);
    layoutGuide3.al_size.equal(layoutGuide1);
    layoutGuide3.al_centerY.equal(layoutGuide1);
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
        if (@available(iOS 11.0, *)) {
            button.al_bottom.equal(self.safeAreaLayoutGuide);
            button.al_left.equal(self.safeAreaLayoutGuide);
            button.al_right.equal(self.safeAreaLayoutGuide);
            button.al_height.equal(100);
        } else {
            button.al_bottom.equal(self);
            button.al_left.equal(self);
            button.al_right.equal(self);
            button.al_height.equal(100);
        }
#else
    button.al_bottom.equal(self);
    button.al_left.equal(self);
    button.al_right.equal(self);
    button.al_height.equal(100);
#endif
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)animateLayoutGuide {
    static CGFloat offset = 0;
    offset += 10;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
    if (@available(iOS 11.0, *)) {
        self.layoutGuide1.al_centerY.update().equal(self.safeAreaLayoutGuide).offset(offset);
    } else {
        self.layoutGuide1.al_centerY.update().equal(self).offset(offset);
    }
#else
    self.layoutGuide1.al_centerY.update().equal(self).offset(offset);
#endif
}

@end
