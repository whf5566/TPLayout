//
//  UILayoutGuide+TPAutolayout.m
//  TPLayout
//
//  Created by weihuafeng on 2017/9/19.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "UILayoutGuide+TPAutolayout.h"
#import "TPLayoutAttributeItem.h"

#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 90000)

@implementation UILayoutGuide (TPAutolayout)

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

- (TPLayoutCompositeAttributeItem *)al_size {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_width, self.al_height]];
}

- (TPLayoutCompositeAttributeItem *)al_center {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_centerX, self.al_centerY]];
}

- (TPLayoutCompositeAttributeItem *)al_edges {
    return [[TPLayoutCompositeAttributeItem alloc] initWithAttributeItemArray:@[self.al_top, self.al_left, self.al_right, self.al_bottom]];
}

- (TPLayoutAttributeItem *)_tpLayoutAttributeItemWith:(NSLayoutAttribute)attribute {
    return [[TPLayoutAttributeItem alloc] initWithView:self.owningView layoutItem:self attribute:attribute];
}

@end

#endif
