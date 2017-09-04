//
//  NSArray+TPAutolayout.m
//  TPLayout
//
//  Created by weihuafeng on 2017/7/13.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "NSArray+TPAutolayout.h"
#import "NSLayoutConstraint+TPAutolayout.h"

@implementation NSArray (TPAutolayout)

- (NSArray<NSLayoutConstraint *> * (^)(CGFloat))offset {
    return ^(CGFloat val) {
        for (NSLayoutConstraint *constraint in self) {
            constraint.offset(val);
        }
        return self;
    };
}

- (NSArray<NSLayoutConstraint *> * (^)(UIEdgeInsets insets))insets {
    return ^(UIEdgeInsets insets) {
        for (NSLayoutConstraint *constraint in self) {
            constraint.insets(insets);
        }
        return self;
    };
}

- (NSArray<NSLayoutConstraint *> * (^)(CGFloat inset))inset {
    return ^(CGFloat inset) {
        return self.insets(UIEdgeInsetsMake(inset, inset, inset, inset));
    };
}

- (NSArray<NSLayoutConstraint *> * (^)(CGSize sizeOffset))sizeOffset {
    return ^(CGSize sizeOffset) {
        for (NSLayoutConstraint *constraint in self) {
            constraint.sizeOffset(sizeOffset);
        }
        return self;
    };
}

- (NSArray<NSLayoutConstraint *> * (^)(CGPoint centerOffset))centerOffset {
    return ^(CGPoint centerOffset) {
        for (NSLayoutConstraint *constraint in self) {
            constraint.centerOffset(centerOffset);
        }
        return self;
    };
}

@end
