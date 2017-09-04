//
//  TPLayout.h
//  TPLayout
//
//  Created by weihuafeng on 2017/7/11.
//  Copyright © 2017年 tpkit. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<TPLayout/TPLayout.h>)

//! Project version number for TPLayout.
FOUNDATION_EXPORT double TPLayoutVersionNumber;

//! Project version string for TPLayout.
FOUNDATION_EXPORT const unsigned char TPLayoutVersionString[];



#import <TPLayout/UIView+TPFrame.h>
#import <TPLayout/TPLayoutMacros.h>

#import <TPLayout/UIView+TPAutolayout.h>
#import <TPLayout/TPLayoutAttributeItem.h>
#import <TPLayout/NSArray+TPAutolayout.h>
#import <TPLayout/NSLayoutConstraint+TPAutolayout.h>

#else


#import "UIView+TPFrame.h"
#import "TPLayoutMacros.h"

#import "UIView+TPAutolayout.h"
#import "TPLayoutAttributeItem.h"
#import "NSArray+TPAutolayout.h"
#import "NSLayoutConstraint+TPAutolayout.h"

#endif
