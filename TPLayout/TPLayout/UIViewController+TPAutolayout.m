//
//  UIViewController+TPAutolayout.m
//  TPLayout
//
//  Created by weihuafeng on 2017/9/19.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "UIViewController+TPAutolayout.h"
#import "TPLayoutAttributeItem.h"

@implementation UIViewController (TPAutolayout)

- (TPLayoutAttributeItem *)al_topLayoutGuide {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom];
}

- (TPLayoutAttributeItem *)al_bottomLayoutGuide {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom];
}

- (TPLayoutAttributeItem *)al_topLayoutGuideTop {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.topLayoutGuide attribute:NSLayoutAttributeTop];
}

- (TPLayoutAttributeItem *)al_topLayoutGuideBottom {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom];
}

- (TPLayoutAttributeItem *)al_bottomLayoutGuideTop {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop];
}

- (TPLayoutAttributeItem *)al_bottomLayoutGuideBottom {
    return [[TPLayoutAttributeItem alloc] initWithView:self.view layoutItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom];
}

@end
