//
//  AutoLayoutExampleViewController.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/11.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "AutoLayoutExampleViewController.h"

@interface AutoLayoutExampleViewController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation AutoLayoutExampleViewController

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (self) {
        self.title = title;
        self.viewClass = viewClass;
    }

    return self;
}


- (void)loadView {
    self.view = self.viewClass.new;
    self.view.backgroundColor = [UIColor whiteColor];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

@end
