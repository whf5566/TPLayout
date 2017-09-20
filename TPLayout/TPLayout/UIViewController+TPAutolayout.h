//
//  UIViewController+TPAutolayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/9/19.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPLayoutAttributeItem;

@interface UIViewController (TPAutolayout)

/**
 *    following properties return a new UIViewController with appropriate UILayoutGuide and NSLayoutAttribute
 */
- (TPLayoutAttributeItem *)al_topLayoutGuide;
- (TPLayoutAttributeItem *)al_bottomLayoutGuide;

- (TPLayoutAttributeItem *)al_topLayoutGuideTop;
- (TPLayoutAttributeItem *)al_topLayoutGuideBottom;

- (TPLayoutAttributeItem *)al_bottomLayoutGuideTop;
- (TPLayoutAttributeItem *)al_bottomLayoutGuideBottom;

@end
