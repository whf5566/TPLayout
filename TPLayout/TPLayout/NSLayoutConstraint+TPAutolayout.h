//
//  NSLayoutConstraint+TPAutolayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (TPAutolayout)

/**
 *	Modifies the NSLayoutConstraint constant
 */
- (NSLayoutConstraint * (^)(CGFloat offset))offset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (NSLayoutConstraint * (^)(UIEdgeInsets insets))insets;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeTop, NSLayoutAttributeLeft, NSLayoutAttributeBottom, NSLayoutAttributeRight
 */
- (NSLayoutConstraint * (^)(CGFloat inset))inset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeWidth, NSLayoutAttributeHeight
 */
- (NSLayoutConstraint * (^)(CGSize offset))sizeOffset;

/**
 *	Modifies the NSLayoutConstraint constant,
 *  only affects NSLayoutConstraint in which the first item's NSLayoutAttribute is one of the following
 *  NSLayoutAttributeCenterX, NSLayoutAttributeCenterY
 */
- (NSLayoutConstraint * (^)(CGPoint offset))centerOffset;

@end

@interface NSLayoutConstraint (TPAutolayout_InstallConstraints)

- (BOOL)tp_isSimilarTo:(NSLayoutConstraint *)constraint;

- (UIView *)tp_firstView;
- (UIView *)tp_secondView;
- (UIView *)tp_installView;
- (BOOL)tp_isInstalled;

- (void)tp_autoInstall;
- (void)tp_autoRemove;

+ (void)tp_activateConstraints:(NSArray<NSLayoutConstraint *> *)constraints;
+ (void)tp_deactivateConstraints:(NSArray<NSLayoutConstraint *> *)constraints;

@end
