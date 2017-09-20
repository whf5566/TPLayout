//
//  UILayoutGuide+TPAutolayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/9/19.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 90000)

@class TPLayoutAttributeItem, TPLayoutCompositeAttributeItem;

@interface UILayoutGuide (TPAutolayout)

/**
 *    following properties return a new TPLayoutAttributeItem with current UILayoutGuide and appropriate NSLayoutAttribute
 */

- (TPLayoutAttributeItem *)al_left;
- (TPLayoutAttributeItem *)al_top;
- (TPLayoutAttributeItem *)al_right;
- (TPLayoutAttributeItem *)al_bottom;
- (TPLayoutAttributeItem *)al_leading;
- (TPLayoutAttributeItem *)al_trailing;
- (TPLayoutAttributeItem *)al_width;
- (TPLayoutAttributeItem *)al_height;
- (TPLayoutAttributeItem *)al_centerX;
- (TPLayoutAttributeItem *)al_centerY;
- (TPLayoutAttributeItem *)al_baseline;

- (TPLayoutAttributeItem *)al_firstBaseline;
- (TPLayoutAttributeItem *)al_lastBaseline;
- (TPLayoutAttributeItem *)al_leftMargin;
- (TPLayoutAttributeItem *)al_rightMargin;
- (TPLayoutAttributeItem *)al_topMargin;
- (TPLayoutAttributeItem *)al_bottomMargin;
- (TPLayoutAttributeItem *)al_leadingMargin;
- (TPLayoutAttributeItem *)al_trailingMargin;
- (TPLayoutAttributeItem *)al_centerXWithinMargins;
- (TPLayoutAttributeItem *)al_centerYWithinMargins;

/**
 *    following properties return a new TPLayoutCompositeAttributeItem with current UILayoutGuide and appropriate NSLayoutAttribute
 */

- (TPLayoutCompositeAttributeItem *)al_size;
- (TPLayoutCompositeAttributeItem *)al_center;
- (TPLayoutCompositeAttributeItem *)al_edges;

@end

#endif
