//
//  UIView+TPAutolayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/7/6.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPLayoutAttributeItem, TPLayoutCompositeAttributeItem;

@interface UIView (TPAutolayout)

/**
 *	following properties return a new TPLayoutAttributeItem with current view and appropriate NSLayoutAttribute
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

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000)

- (TPLayoutAttributeItem *)al_firstBaseline NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_lastBaseline NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_leftMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_rightMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_topMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_bottomMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_leadingMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_trailingMargin NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_centerXWithinMargins NS_AVAILABLE_IOS(8_0);
- (TPLayoutAttributeItem *)al_centerYWithinMargins NS_AVAILABLE_IOS(8_0);

#endif

/**
 *	following properties return a new TPLayoutCompositeAttributeItem with current view and appropriate NSLayoutAttribute
 */

- (TPLayoutCompositeAttributeItem *)al_size;
- (TPLayoutCompositeAttributeItem *)al_center;
- (TPLayoutCompositeAttributeItem *)al_edges;

@end



@interface NSObject (TPAutolayout_Constraints)

- (NSHashTable<NSLayoutConstraint *> *)al_installedConstraints;

@end

@interface UIView (TPAutolayout_Constraints)

- (UIView *(^)(void))al_resetAll;
- (void)al_resetConstraints:(NSLayoutAttribute)attribute;

@end
