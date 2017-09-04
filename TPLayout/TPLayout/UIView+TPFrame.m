//
//  UIView+TPFrame.m
//  TPLayout
//
//  Created by weihuafeng on 2017/6/30.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "UIView+TPFrame.h"

@implementation UIView (TPFrame)

- (CGFloat)tp_left {
    return self.frame.origin.x;
}

- (void)setTp_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)tp_top {
    return self.frame.origin.y;
}

- (void)setTp_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)tp_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTp_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)tp_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTp_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tp_width {
    return self.frame.size.width;
}

- (void)setTp_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)tp_height {
    return self.frame.size.height;
}

- (void)setTp_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)tp_centerX {
    return self.center.x;
}

- (void)setTp_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)tp_centerY {
    return self.center.y;
}

- (void)setTp_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)tp_origin {
    return self.frame.origin;
}

- (void)setTp_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)tp_size {
    return self.frame.size;
}

- (void)setTp_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)tp_leftResize {
    return self.frame.origin.x;
}

- (void)setTp_leftResize:(CGFloat)x {
    CGRect frame = self.frame;
    frame.size.width  += MAX((frame.origin.x - x), -frame.size.width);
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)tp_topResize {
    return self.frame.origin.y;
}

- (void)setTp_topResize:(CGFloat)y {
    CGRect frame = self.frame;
    frame.size.height  += MAX((frame.origin.y - y), -frame.size.height);
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)tp_rightResize {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTp_rightResize:(CGFloat)right {
    CGRect frame = self.frame;
    frame.size.width  = MAX((right - frame.origin.x),0);
    self.frame = frame;
}

- (CGFloat)tp_bottomResize {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTp_bottomResize:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.size.height = MAX((bottom - frame.origin.y),0);
    self.frame = frame;
}

- (CGPoint)tp_originResize {
    return self.frame.origin;
}

- (void)setTp_originResize:(CGPoint)origin {
    self.tp_leftResize = origin.x;
    self.tp_topResize = origin.y;
}


- (UIView *)tp_ancestorView {
    UIView *ancestorView = self;
    while (ancestorView.superview) {
        ancestorView = ancestorView.superview;
    }
    return ancestorView;
}

- (CGPoint)convertPointToSuperView:(CGPoint)point fromView:(UIView *)view {
    UIView *ancestorView = self.tp_ancestorView;
    CGPoint viewCenterPoint = [(view.superview?:view) convertPoint:point toView:ancestorView];
    return [ancestorView convertPoint:viewCenterPoint toView:self.superview];
}

- (void)leftToViewLeft:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newLeft = viewOrigin.x + offset;
    if (fixedSize) {
        self.tp_left = newLeft;
    } else {
        self.tp_leftResize = newLeft;
    }
}

- (void)leftToViewRight:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newLeft = viewOrigin.x + view.frame.size.width + offset;
    if (fixedSize) {
        self.tp_left = newLeft;
    } else {
        self.tp_leftResize = newLeft;
    }
}

- (void)rightToViewLeft:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newRight = viewOrigin.x + offset;
    if (fixedSize) {
        self.tp_right = newRight;
    } else {
        self.tp_rightResize = newRight;
    }
}

- (void)rightToViewRight:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newRight = viewOrigin.x + view.frame.size.width + offset;
    if (fixedSize) {
        self.tp_right = newRight;
    } else {
        self.tp_rightResize = newRight;
    }
}

- (void)topToViewTop:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newTop = viewOrigin.y + offset;
    if (fixedSize) {
        self.tp_top = newTop;
    } else {
        self.tp_topResize = newTop;
    }
}

- (void)topToViewBottom:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newTop = viewOrigin.y + view.frame.size.height + offset;
    if (fixedSize) {
        self.tp_top = newTop;
    } else {
        self.tp_topResize = newTop;
    }
}

- (void)bottomToViewTop:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newBottom = viewOrigin.y + offset;
    if (fixedSize) {
        self.tp_bottom = newBottom;
    } else {
        self.tp_bottomResize = newBottom;
    }
}

- (void)bottomToViewBottom:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    CGFloat newBottom = viewOrigin.y + view.frame.size.height + offset;
    if (fixedSize) {
        self.tp_bottom = newBottom;
    } else {
        self.tp_bottomResize = newBottom;
    }
}

- (void)centerXToView:(UIView *)view offset:(CGFloat)offset {
    CGPoint centerPoint = [self convertPointToSuperView:view.center fromView:view];
    self.tp_centerX = centerPoint.x + offset;
}

- (void)centerYToView:(UIView *)view offset:(CGFloat)offset {
    CGPoint centerPoint = [self convertPointToSuperView:view.center fromView:view];
    self.tp_centerY = centerPoint.y + offset;
}

- (void)centerToView:(UIView *)view  offsetSize:(CGSize)offsetSize {
    CGPoint centerPoint = [self convertPointToSuperView:view.center fromView:view];
    self.center = CGPointMake(centerPoint.x + offsetSize.width, centerPoint.y + offsetSize.height);
}

- (void)centerInView:(UIView *)view {
    [self centerToView:view offsetSize:CGSizeZero];
}

- (void)edgesToView:(UIView *)view offsetEdge:(UIEdgeInsets)insets {
    CGPoint viewOrigin = [self convertPointToSuperView:view.frame.origin fromView:view];
    self.tp_leftResize = viewOrigin.x + insets.left;
    self.tp_topResize = viewOrigin.y + insets.top;
    self.tp_rightResize = viewOrigin.x + view.frame.size.width + (-insets.right);
    self.tp_bottomResize = viewOrigin.y + view.frame.size.height + (-insets.bottom);
}


@end
