//
//  UIView+TPFrame.h
//  TPLayout
//
//  Created by weihuafeng on 2017/6/30.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TPFrame)

@property (nonatomic, assign) CGFloat tp_left;    // frame.origin.x
@property (nonatomic, assign) CGFloat tp_top;     // frame.origin.y
@property (nonatomic, assign) CGFloat tp_right;   // frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat tp_bottom;  // frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat tp_width;   // frame.size.width
@property (nonatomic, assign) CGFloat tp_height;  // frame.size.height
@property (nonatomic, assign) CGFloat tp_centerX; // center.x
@property (nonatomic, assign) CGFloat tp_centerY; // center.y
@property (nonatomic, assign) CGPoint tp_origin;  // frame.origin
@property (nonatomic, assign) CGSize  tp_size;    // frame.size

@property (nonatomic, assign) CGFloat tp_leftResize;  // frame.origin.x; frame.size.width  += (frame.origin.x - x)
@property (nonatomic, assign) CGFloat tp_topResize;   // frame.origin.y; frame.size.height += (frame.origin.y - y)
@property (nonatomic, assign) CGFloat tp_rightResize; // frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat tp_bottomResize;// frame.origin.y + frame.size.height
@property (nonatomic, assign) CGPoint tp_originResize;// frame.origin

- (UIView *)tp_ancestorView;


- (void)leftToViewLeft:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;
- (void)leftToViewRight:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;

- (void)rightToViewLeft:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;
- (void)rightToViewRight:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;

- (void)topToViewTop:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;
- (void)topToViewBottom:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;

- (void)bottomToViewTop:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;
- (void)bottomToViewBottom:(UIView *)view offset:(CGFloat)offset fixedSize:(BOOL)fixedSize;

- (void)centerXToView:(UIView *)view offset:(CGFloat)offset;
- (void)centerYToView:(UIView *)view offset:(CGFloat)offset;
- (void)centerToView:(UIView *)view  offsetSize:(CGSize)offsetSize;
- (void)centerInView:(UIView *)view;

- (void)edgesToView:(UIView *)view offsetEdge:(UIEdgeInsets)insets;

@end
