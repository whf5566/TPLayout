//
//  TPLayoutAttributeItem.m
//  TPLayout
//
//  Created by weihuafeng on 2017/7/13.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "TPLayoutAttributeItem.h"
#import "TPLayoutMacros.h"
#import "NSLayoutConstraint+TPAutolayout.h"
#import "UIView+TPAutolayout.h"

typedef NS_ENUM(NSInteger, TPLayoutAttributeOperation) {
    TPLayoutAttributeOperationNone = 0, // install constraint
    TPLayoutAttributeOperationUpdate,   // update similar constraint
    TPLayoutAttributeOperationReset,    // reset constraints for attribute
};

@implementation TPLayoutAttributeBaseItem

- (id (^)(id))equal {
    return nil;
}

- (id (^)(id))greaterOrEqual {
    return nil;
}

- (id (^)(id))lessOrEqual {
    return nil;
}

- (id (^)(void))update {
    return nil;
}

- (id (^)(void))reset {
    return nil;
}

- (id (^)(UILayoutPriority priority))priority {
    return nil;
}

- (id (^)(void))priorityLow {
    return nil;
}

- (id (^)(void))priorityMedium {
    return nil;
}

- (id (^)(void))priorityHigh {
    return nil;
}

- (id (^)(CGFloat multiplier))multiplier {
    return nil;
}

@end

@interface TPLayoutAttributeItem ()
@property (nonatomic, assign, readonly) TPLayoutAttributeOperation operation;
@property (nonatomic, assign, readonly) NSLayoutAttribute layoutAttribute;
@property (nonatomic, weak, readonly) id constraintItem;
@property (nonatomic, weak, readonly) UIView *view;
@property (nonatomic, assign) UILayoutPriority priorityValue;
@property (nonatomic, assign) CGFloat multiplierValue;

- (void)setAttributeOperation:(TPLayoutAttributeOperation)operation;
- (CGFloat)_constantWithAttribute:(NSLayoutAttribute)attribute value:(NSValue *)value;

@end

@interface TPLayoutCompositeAttributeItem ()
@property (nonatomic, strong, readonly) NSArray<TPLayoutAttributeItem *> *itemArray;
@property (nonatomic, assign, readonly) TPLayoutAttributeOperation operation;

- (TPLayoutAttributeItem *)_attributeItemWith:(NSLayoutAttribute)attribute;

@end

#pragma mark - TPLayoutAttributeItem

@implementation TPLayoutAttributeItem

- (instancetype)initWithView:(UIView *)view attribute:(NSLayoutAttribute)layoutAttribute {
    return [self initWithView:view layoutItem:view attribute:layoutAttribute];
}

- (instancetype)initWithView:(UIView *)view layoutItem:(id)layoutItem attribute:(NSLayoutAttribute)layoutAttribute {
    return [self initWithView:view layoutItem:layoutItem attribute:layoutAttribute operation:TPLayoutAttributeOperationNone];
}

- (instancetype)initWithView:(UIView *)view layoutItem:(id)layoutItem attribute:(NSLayoutAttribute)layoutAttribute operation:(TPLayoutAttributeOperation)operation {
    self = [super init];
    if (self) {
        _constraintItem = layoutItem;
        _view = view;
        _layoutAttribute = layoutAttribute;
        _priorityValue = UILayoutPriorityRequired;
        _multiplierValue = 1.0;
        _operation = operation;
    }
    return self;
}

- (NSLayoutConstraint *)constraintWithItem:(id)secondItem relatedBy:(NSLayoutRelation)relation priority:(UILayoutPriority)priority {
    id layoutItem2 = nil;
    UIView *layoutView2 = nil;
    NSLayoutAttribute attr2 = NSLayoutAttributeNotAnAttribute;
    CGFloat constant = 0;
    
    if ([secondItem isKindOfClass:NSValue.class]) {
        if (self.layoutAttribute != NSLayoutAttributeHeight && self.layoutAttribute != NSLayoutAttributeWidth) {
            if ([self.constraintItem isKindOfClass:UIView.class]) {
                layoutItem2 = self.view.superview;
                layoutView2 = self.view.superview;
                attr2 = self.layoutAttribute;
            }
 #if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 90000)
            else if ([self.constraintItem isKindOfClass:UILayoutGuide.class]) {
                layoutItem2 = self.view;
                layoutView2 = self.view;
                attr2 = self.layoutAttribute;
            }
#endif
        }
        constant = [self _constantWithAttribute:self.layoutAttribute value:secondItem];
    } else if ([secondItem isKindOfClass:UIView.class]) {
        layoutItem2 = secondItem;
        layoutView2 = secondItem;
        attr2 = self.layoutAttribute;
    }
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 90000)
    else if ([secondItem isKindOfClass:UILayoutGuide.class]) {
        layoutItem2 = secondItem;
        layoutView2 = ((UILayoutGuide *)secondItem).owningView;
        attr2 = self.layoutAttribute;
    }
#endif
    else if ([secondItem isKindOfClass:TPLayoutAttributeItem.class]) {
        layoutItem2 = [(TPLayoutAttributeItem *)secondItem constraintItem];
        layoutView2 = [(TPLayoutAttributeItem *)secondItem view];
        attr2 = [(TPLayoutAttributeItem *)secondItem layoutAttribute];
        NSAssert(TPIsLayoutAttributesSuited(self.layoutAttribute, attr2), @"Can't constraint for unsuited layoutAttributes");
    } else if ([secondItem isKindOfClass:TPLayoutCompositeAttributeItem.class]) {
        id item = [(TPLayoutCompositeAttributeItem *)secondItem _attributeItemWith:self.layoutAttribute];
        NSAssert(item, @"Can't constraint unknow second composite item or constant");
        return item ? [self constraintWithItem:item relatedBy:relation priority:priority] : nil;
    } else {
        NSAssert(nil, @"Can't constraint unknow second item or constant");
    }
    
    if ([self.constraintItem isKindOfClass:UIView.class]) {
        [(UIView *)self.constraintItem setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.constraintItem attribute:self.layoutAttribute relatedBy:relation toItem:layoutItem2 attribute:attr2 multiplier:self.multiplierValue constant:constant];
    constraint.priority = priority;
    
    if (self.operation == TPLayoutAttributeOperationUpdate) {
        UIView *installView = [self _installViewForFirstView:self.view sencondView:layoutView2 firstAttribute:self.layoutAttribute];
        NSLayoutConstraint *existConstraint = [self _constraintSimilarTo:constraint installView:installView];
        if (existConstraint) {
            existConstraint.constant = constraint.constant;
            if((![existConstraint tp_isInstalled])) {
                [existConstraint tp_autoInstall];
            }
            return existConstraint;
        }
    }
    
    [constraint tp_autoInstall];
    return constraint;
}

- (UIView *)_installViewForFirstView:(UIView *)firstView sencondView:(UIView *)sencondView firstAttribute:(NSLayoutAttribute)firstAttribute {
    UIView *installView = nil;
    if (firstView && sencondView) {
        installView = [self _commonSuperViewFor:firstView view2:sencondView];
    } else {
        if (firstAttribute == NSLayoutAttributeWidth || firstAttribute == NSLayoutAttributeHeight) {
            installView = firstView;
        } else {
            installView = firstView.superview;
        }
    }
    return installView;
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

- (NSLayoutConstraint *)_constraintSimilarTo:(NSLayoutConstraint *)newConstraint installView:(UIView *)installView {
    NSLayoutConstraint *existConstraint = nil;
    NSArray *installedConstraints = [newConstraint.firstItem al_installedConstraints].allObjects;
    for (NSLayoutConstraint *constraint in installedConstraints) {
        if ([constraint tp_isSimilarTo:newConstraint]) {
            existConstraint = constraint;
            break;
        }
    }
    
    if (!existConstraint) {
        for (NSLayoutConstraint *constraint in installView.constraints.reverseObjectEnumerator) {
            if ([constraint tp_isSimilarTo:newConstraint]) {
                existConstraint = constraint;
                break;
            }
        }
    }
    return existConstraint;
}

- (CGFloat)_constantWithAttribute:(NSLayoutAttribute)attribute value:(NSValue *)value {
    if ([value isKindOfClass:NSNumber.class]) {
        return [(NSNumber *)value doubleValue];
    } else if (strcmp(value.objCType, @encode(CGPoint)) == 0) {
        CGPoint centerOffset = CGPointZero;
        [value getValue:&centerOffset];
        
        if (attribute == NSLayoutAttributeCenterX) {
            return centerOffset.x;
        } else if (attribute == NSLayoutAttributeCenterY) {
            return centerOffset.y;
        }
    } else if (strcmp(value.objCType, @encode(CGSize)) == 0) {
        CGSize sizeOffset = CGSizeZero;
        [value getValue:&sizeOffset];
        
        if (attribute == NSLayoutAttributeWidth) {
            return sizeOffset.width;
        } else if (attribute == NSLayoutAttributeHeight) {
            return sizeOffset.height;
        }
    } else if (strcmp(value.objCType, @encode(UIEdgeInsets)) == 0) {
        UIEdgeInsets insets = UIEdgeInsetsZero;
        [value getValue:&insets];
        
        if (attribute == NSLayoutAttributeLeft
            || attribute == NSLayoutAttributeLeading) {
            return insets.left;
        } else if (attribute == NSLayoutAttributeTop) {
            return insets.top;
        } else if (attribute == NSLayoutAttributeRight
                   || attribute == NSLayoutAttributeTrailing) {
            return (-insets.right);
        } else if (attribute == NSLayoutAttributeBottom) {
            return (-insets.bottom);
        }
    } else {
        NSAssert(NO, @"attempting to set layout constant with unsupported value: %@", value);
    }
    
    NSAssert(NO, @"can not set layout constant for view:%@ with value: %@", self.constraintItem, value);
    return 0;
}


- (void)setAttributeOperation:(TPLayoutAttributeOperation)operation {
    _operation = operation;
}

- (id(^)(id))equal {
    return ^(id secondItem) {
        return [self constraintWithItem:secondItem relatedBy:NSLayoutRelationEqual priority:self.priorityValue];
    };
}

- (id(^)(id))greaterOrEqual {
    return ^(id secondItem) {
        return [self constraintWithItem:secondItem relatedBy:NSLayoutRelationGreaterThanOrEqual priority:self.priorityValue];
    };
}

- (id(^)(id))lessOrEqual {
    return ^(id secondItem) {
        return [self constraintWithItem:secondItem relatedBy:NSLayoutRelationLessThanOrEqual priority:self.priorityValue];
    };
}

- (id(^)(void))update {
    return ^{
        [self setAttributeOperation:TPLayoutAttributeOperationUpdate];
        return self;
    };
}

- (id(^)(void))reset {
    return ^{
        [self setAttributeOperation:TPLayoutAttributeOperationReset];
        [self.constraintItem al_resetConstraints:self.layoutAttribute];
        return self;
    };
}

- (id(^)(UILayoutPriority priority))priority {
    return ^(UILayoutPriority priority) {
        self.priorityValue = priority;
        return self;
    };
}

- (id(^)(void))priorityLow {
    return ^() {
        self.priorityValue = UILayoutPriorityDefaultLow;
        return self;
    };
}

- (id(^)(void))priorityMedium {
    return ^() {
        self.priorityValue = 500.0;
        return self;
    };
}

- (id(^)(void))priorityHigh {
    return ^() {
        self.priorityValue = UILayoutPriorityDefaultHigh;
        return self;
    };
}

- (id(^)(CGFloat multiplier))multiplier {
    return ^(CGFloat multiplier) {
        self.multiplierValue = multiplier;
        return self;
    };
}

@end

#pragma mark - TPLayoutCompositeAttributeItem

@implementation TPLayoutCompositeAttributeItem

- (instancetype)initWithAttributeItemArray:(NSArray *)array {
    return [self initWithAttributeItemArray:array operation:TPLayoutAttributeOperationNone];
}

- (instancetype)initWithAttributeItemArray:(NSArray *)array operation:(TPLayoutAttributeOperation)operation {
    self = [super init];
    if (self) {
        _itemArray = array;
        _operation = operation;
    }
    return self;
}

- (TPLayoutAttributeItem *)_attributeItemWith:(NSLayoutAttribute)attribute {
    for (TPLayoutAttributeItem *item in self.itemArray) {
        if (item.layoutAttribute == attribute) {
            return item;
        }
    }
    return nil;
}

- (NSArray<NSLayoutConstraint *> *)constraintsWithSencondItem:(id)secondItem relatedBy:(NSLayoutRelation)relation {
    NSMutableArray *constraintArray = [NSMutableArray arrayWithCapacity:self.itemArray.count];
    for (TPLayoutAttributeItem *attributeItem in self.itemArray) {
        NSLayoutConstraint *constraint = [attributeItem constraintWithItem:secondItem relatedBy:relation priority:attributeItem.priorityValue];
        if (constraint) {
            [constraintArray addObject:constraint];
        }
    }
    return constraintArray.count ? constraintArray : nil;
}

- (void)setAttributeOperation:(TPLayoutAttributeOperation)operation {
    _operation = operation;
}

- (id(^)(id))equal {
    return ^(id secondItem) {
        return [self constraintsWithSencondItem:secondItem relatedBy:NSLayoutRelationEqual];
    };
}

- (id(^)(id))greaterOrEqual {
    return ^(id secondItem) {
        return [self constraintsWithSencondItem:secondItem relatedBy:NSLayoutRelationGreaterThanOrEqual];
    };
}

- (id(^)(id))lessOrEqual {
    return ^(id secondItem) {
        return [self constraintsWithSencondItem:secondItem relatedBy:NSLayoutRelationLessThanOrEqual];
    };
}

- (id(^)(void))update {
    return ^{
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.update();
        }
        [self setAttributeOperation:TPLayoutAttributeOperationUpdate];
        return self;
    };
}

- (id(^)(void))reset {
    return ^{
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.reset();
        }
        [self setAttributeOperation:TPLayoutAttributeOperationReset];
        return self;
    };
}

- (id(^)(UILayoutPriority priority))priority {
    return ^(UILayoutPriority priority){
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.priority(priority);
        }
        return self;
    };
}


- (id(^)(void))priorityLow {
    return ^() {
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.priorityLow();
        }
        return self;
    };
}

- (id(^)(void))priorityMedium {
    return ^() {
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.priorityMedium();
        }
        return self;
    };
}

- (id(^)(void))priorityHigh {
    return ^() {
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.priorityHigh();
        }
        return self;
    };
}
- (id(^)(CGFloat multiplier))multiplier {
    return ^(CGFloat multiplier){
        for (TPLayoutAttributeItem *item in self.itemArray) {
            item.multiplier(multiplier);
        }
        return self;
    };
}

@end
