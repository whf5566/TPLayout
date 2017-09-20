//
//  TPLayoutAttributeItem.h
//  TPLayout
//
//  Created by weihuafeng on 2017/7/13.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - TPLayoutAttributeBaseItem

@interface TPLayoutAttributeBaseItem <AttributeItemType, ConstraintType> : NSObject

/**
 *	Creates a NSLayoutConstraint or NSLayoutConstraint's NSArray,
 *  that NSLayoutConstraint relation property is NSLayoutRelationEqual.
 */
- (ConstraintType (^)(id))equal;

/**
 *	Creates a NSLayoutConstraint or NSLayoutConstraint's NSArray,
 *  that NSLayoutConstraint relation property is NSLayoutRelationGreaterThanOrEqual.
 */
- (ConstraintType (^)(id))greaterOrEqual;

/**
 *	Creates a NSLayoutConstraint or NSLayoutConstraint's NSArray,
 *  that NSLayoutConstraint relation property is NSLayoutRelationLessThanOrEqual.
 */
- (ConstraintType (^)(id))lessOrEqual;

/**
 *	Updates the NSLayoutConstraint that is similar to self.
 */
- (AttributeItemType (^)(void))update;

/**
 *	Deactivates the NSLayoutConstraint,
 *  which the first item's NSLayoutAttribute is same with TPLayoutAttributeBaseItem's NSLayoutAttribute
 */
- (AttributeItemType (^)(void))reset;

/**
 *	Sets the NSLayoutConstraint multiplier property
 */
- (AttributeItemType (^)(CGFloat multiplier))multiplier;

/**
 *	Sets the NSLayoutConstraint priority to a float or MASLayoutPriority
 */
- (AttributeItemType (^)(UILayoutPriority priority))priority;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityLow
 */
- (AttributeItemType (^)(void))priorityLow;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityMedium
 */
- (AttributeItemType (^)(void))priorityMedium;

/**
 *	Sets the NSLayoutConstraint priority to MASLayoutPriorityHigh
 */
- (AttributeItemType (^)(void))priorityHigh;

@end

#pragma mark - TPLayoutAttributeItem

@class TPLayoutAttributeItem;
@interface TPLayoutAttributeItem : TPLayoutAttributeBaseItem <TPLayoutAttributeItem *, NSLayoutConstraint *>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)layoutAttribute;
- (instancetype)initWithView:(UIView *)view layoutItem:(id)layoutItem attribute:(NSLayoutAttribute)layoutAttribute;

@end

#pragma mark - TPLayoutCompositeAttributeItem

@class TPLayoutCompositeAttributeItem;
@interface TPLayoutCompositeAttributeItem : TPLayoutAttributeBaseItem <TPLayoutCompositeAttributeItem *, NSArray<NSLayoutConstraint *> *>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithAttributeItemArray:(NSArray *)array;

@end
