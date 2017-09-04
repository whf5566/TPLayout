//
//  NSLayoutConstraint+TPAutolayout.m
//  TPLayout
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "NSLayoutConstraint+TPAutolayout.h"
#import "UIView+TPAutolayout.h"

#define TPCGFloatEqual(A,B) ((ABS((A) - (B))) < FLT_EPSILON)


@implementation NSLayoutConstraint (TPAutolayout)

- (NSLayoutConstraint * (^)(CGFloat))offset {
    return ^(CGFloat val) {
        self.constant = val;
        return self;
    };
}

- (NSLayoutConstraint * (^)(UIEdgeInsets insets))insets {
    return ^(UIEdgeInsets insets) {
        NSLayoutAttribute attribute = self.firstAttribute;
        if (attribute == NSLayoutAttributeLeft
            || attribute == NSLayoutAttributeLeading) {
            self.constant = insets.left;
        } else if (attribute == NSLayoutAttributeTop) {
            self.constant = insets.top;
        } else if (attribute == NSLayoutAttributeBottom) {
            self.constant = -insets.bottom;
        } else if (attribute == NSLayoutAttributeRight
                   || attribute == NSLayoutAttributeTrailing) {
            self.constant = -insets.right;
        }
        return self;
    };
}

- (NSLayoutConstraint * (^)(CGFloat inset))inset {
    return ^(CGFloat inset) {
        NSLayoutAttribute attribute = self.firstAttribute;
        if (attribute == NSLayoutAttributeLeft
            || attribute == NSLayoutAttributeLeading
            || attribute == NSLayoutAttributeTop
            || attribute == NSLayoutAttributeBottom
            || attribute == NSLayoutAttributeRight
            || attribute == NSLayoutAttributeTrailing) {
            self.constant = inset;
        }
        return self;
    };
}

- (NSLayoutConstraint * (^)(CGSize offset))sizeOffset {
    return ^(CGSize sizeOffset) {
        NSLayoutAttribute attribute = self.firstAttribute;
        if (attribute == NSLayoutAttributeWidth) {
            self.constant = sizeOffset.width;
        } else if (attribute == NSLayoutAttributeHeight) {
            self.constant = sizeOffset.height;
        }
        return self;
    };
}

- (NSLayoutConstraint * (^)(CGPoint offset))centerOffset {
    return ^(CGPoint centerOffset) {
        NSLayoutAttribute attribute = self.firstAttribute;
        if (attribute == NSLayoutAttributeCenterX) {
            self.constant = centerOffset.x;
        } else if (attribute == NSLayoutAttributeCenterY) {
            self.constant = centerOffset.y;
        }
        return self;
    };
}

@end

@implementation NSLayoutConstraint (TPAutolayout_InstallConstraints)

- (BOOL)tp_isSimilarTo:(NSLayoutConstraint *)constraint {
    if (self.firstItem != constraint.firstItem
        || self.secondItem != constraint.secondItem
        || self.firstAttribute != constraint.firstAttribute
        || self.secondAttribute != constraint.secondAttribute
        || self.relation != constraint.relation
        || TPCGFloatEqual(self.priority, constraint.priority) == NO
        || TPCGFloatEqual(self.multiplier, constraint.multiplier) == NO ) {
        return NO;
    }
    return YES;
}

- (UIView *)tp_firstView {
    NSAssert(self.firstItem == nil || [self.firstItem isKindOfClass:UIView.class],@"the firstItem of NSLayoutConstraint must be UIView");
    return (UIView *)self.firstItem;
}

- (UIView *)tp_secondView {
    NSAssert(self.secondItem == nil || [self.secondItem isKindOfClass:UIView.class],@"the secondItem of NSLayoutConstraint must be UIView");
    return (UIView *)self.secondItem;
}

- (UIView *)tp_installView {
    UIView *installView = nil;
    if (self.tp_firstView && self.tp_secondView) {
        installView = [self _commonSuperViewFor:self.tp_firstView view2:self.tp_secondView];
    } else {
        if (self.firstAttribute == NSLayoutAttributeWidth || self.firstAttribute == NSLayoutAttributeHeight) {
            installView = self.tp_firstView;
        } else {
            installView = self.tp_firstView.superview;
        }
    }
    return installView;
}

- (BOOL)tp_isInstalled {
    if ([self respondsToSelector:@selector(setActive:)]) {
        return self.active;
    } else {
        return [self.tp_installView.constraints containsObject:self];
    }
}

- (void)tp_autoInstall {
    if ([self respondsToSelector:@selector(setActive:)]) {
        self.active = YES;
    } else {
        NSAssert(self.firstItem || self.secondItem, @"Can't install a constraint with nil firstItem and secondItem.");
        UIView *installView = [self tp_installView];
        NSAssert(installView, @"Can't constrain two views that not have a install view");
        [installView addConstraint:self];
    }
    NSHashTable *hashTable = [self.tp_firstView al_installedConstraints];
    if (![hashTable containsObject:self]) {
        [hashTable addObject:self];
    }
}

- (void)tp_autoRemove {
    if ([self respondsToSelector:@selector(setActive:)]) {
        self.active = NO;
    } else {
        UIView *installView = [self tp_installView];
        while (installView && (![installView.constraints containsObject:self])) {
            installView = installView.superview;
        }
        [installView removeConstraint:self];
    }

    [self.tp_firstView.al_installedConstraints removeObject:self];
}

+ (void)tp_activateConstraints:(NSArray<NSLayoutConstraint *> *)constraints {
    if ([NSLayoutConstraint respondsToSelector:@selector(activateConstraints:)]) {
        [NSLayoutConstraint activateConstraints:constraints];
        for (NSLayoutConstraint *constraint in constraints) {
            NSHashTable *hashTable = constraint.tp_firstView.al_installedConstraints;
            if (![hashTable containsObject:constraint]) {
                [hashTable addObject:constraint];
            }
        }
    } else {
        for (NSLayoutConstraint *constraint in constraints) {
            [constraint tp_autoInstall];
        }
    }
}

+ (void)tp_deactivateConstraints:(NSArray<NSLayoutConstraint *> *)constraints {
    if ([NSLayoutConstraint respondsToSelector:@selector(deactivateConstraints:)]) {
        [NSLayoutConstraint deactivateConstraints:constraints];
        for (NSLayoutConstraint *constraint in constraints) {
            [constraint.tp_firstView.al_installedConstraints removeObject:constraint];
        }
    } else {
        for (NSLayoutConstraint *constraint in constraints) {
            [constraint tp_autoRemove];
        }
    }
}

- (UIView *)_commonSuperViewFor:(UIView *)view1 view2:(UIView *)view2 {
    UIView *commonSuperview = nil;
    UIView *startView = view1;
    while (startView) {
        if ([view2 isDescendantOfView:startView]) {
            commonSuperview = startView;
            break;
        }
        startView = startView.superview;
    }
    return commonSuperview;
}

@end
