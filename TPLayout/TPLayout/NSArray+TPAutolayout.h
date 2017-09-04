//
//  NSArray+TPAutolayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/7/13.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (TPAutolayout)

/**
 *	Modifies the NSLayoutConstraint constant
 */
- (NSArray<NSLayoutConstraint *> * (^)(CGFloat offset))offset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (NSArray<NSLayoutConstraint *> * (^)(UIEdgeInsets insets))insets;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (NSArray<NSLayoutConstraint *> * (^)(CGFloat inset))inset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeWidth, NSLayoutAttributeHeight
 */
- (NSArray<NSLayoutConstraint *> * (^)(CGSize offset))sizeOffset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeCenterX, NSLayoutAttributeCenterY
 */
- (NSArray<NSLayoutConstraint *> * (^)(CGPoint offset))centerOffset;

@end
