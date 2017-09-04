//
//  UIView+TPAutolayout.m
//  TPLayout
//
//  Created by weihuafeng on 2017/7/6.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "UIView+TPAutolayout.h"
#import "TPLayoutAttributeItem.h"
#import "NSLayoutConstraint+TPAutolayout.h"
#import <objc/runtime.h>

#pragma mark - TPAutolayout

@implementation UIView (TPAutolayout)

- (TPLayoutAttributeItem *)al_left {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeLeft];
}

- (TPLayoutAttributeItem *)al_top {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeTop];
}

- (TPLayoutAttributeItem *)al_right {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeRight];
}

- (TPLayoutAttributeItem *)al_bottom {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeBottom];
}

- (TPLayoutAttributeItem *)al_leading {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeLeading];
}

- (TPLayoutAttributeItem *)al_trailing {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeTrailing];
}

- (TPLayoutAttributeItem *)al_width {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeWidth];
}

- (TPLayoutAttributeItem *)al_height {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeHeight];
}

- (TPLayoutAttributeItem *)al_centerX {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeCenterX];
}

- (TPLayoutAttributeItem *)al_centerY {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeCenterY];
}

- (TPLayoutAttributeItem *)al_baseline {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeBaseline];
}

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000)

- (TPLayoutAttributeItem *)al_firstBaseline {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeFirstBaseline];
}

- (TPLayoutAttributeItem *)al_lastBaseline {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeLastBaseline];
}

- (TPLayoutAttributeItem *)al_leftMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeLeftMargin];
}

- (TPLayoutAttributeItem *)al_rightMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeRightMargin];
}

- (TPLayoutAttributeItem *)al_topMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeTopMargin];
}

- (TPLayoutAttributeItem *)al_bottomMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeBottomMargin];
}

- (TPLayoutAttributeItem *)al_leadingMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeLeadingMargin];
}

- (TPLayoutAttributeItem *)al_trailingMargin {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeTrailingMargin];
}

- (TPLayoutAttributeItem *)al_centerXWithinMargins {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeCenterXWithinMargins];
}

- (TPLayoutAttributeItem *)al_centerYWithinMargins {
    return [self _tpLayoutAttributeItemWith:NSLayoutAttributeCenterYWithinMargins];
}

#endif

- (TPLayoutCompositeAttributeItem *)al_size {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_width,self.al_height]];
}

- (TPLayoutCompositeAttributeItem *)al_center {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_centerX,self.al_centerY]];
}

- (TPLayoutCompositeAttributeItem *)al_edges {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_top, self.al_left, self.al_right, self.al_bottom]];
}

- (TPLayoutAttributeItem *)_tpLayoutAttributeItemWith:(NSLayoutAttribute)attribute {
    return [[TPLayoutAttributeItem alloc] initWithLayoutItem:self attribute:attribute];
}


@end


#pragma mark - TPAutolayout_Constraints

@implementation UIView (TPAutolayout_Constraints)

- (NSHashTable<NSLayoutConstraint *> *)al_installedConstraints {
    NSHashTable *constraints = objc_getAssociatedObject(self, _cmd);
    if (!constraints) {
        constraints = [[NSHashTable alloc] initWithOptions:NSPointerFunctionsWeakMemory capacity:8];
        objc_setAssociatedObject(self, _cmd, constraints, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return constraints;
}


- (UIView *(^)(void))al_resetAll {
    return ^{
        [self al_resetAllConstraints];
        return self;
    };
}

- (void)al_resetAllConstraints {
    [NSLayoutConstraint tp_deactivateConstraints:self.al_installedConstraints.allObjects];
}

- (void)al_resetConstraints:(NSLayoutAttribute)attribute {
    [self al_resetConstraintsWithAttributes:@[@(attribute)]];
}

- (void)al_resetConstraintsWithAttributes:(NSArray *)attributeList {
    [NSLayoutConstraint tp_deactivateConstraints:[self al_constraintsWithAttributes:attributeList]];
}

- (NSArray<NSLayoutConstraint *> *)al_constraintsWithAttribute:(NSLayoutAttribute)attribute {
    return [self al_constraintsWithAttributes:@[@(attribute)]];
}

- (NSArray<NSLayoutConstraint *> *)al_constraintsWithAttributes:(NSArray *)attributeList {
    NSMutableArray *constraintList = [NSMutableArray array];
    NSArray *installedList = self.al_installedConstraints.allObjects;
    for (NSLayoutConstraint *constraint in installedList) {
        for (NSNumber *obj in attributeList) {
            if (constraint.firstAttribute == obj.integerValue) {
                [constraintList addObject:constraint];
            }
        }
    }

    return constraintList.count > 0 ? constraintList : nil;
}


@end

