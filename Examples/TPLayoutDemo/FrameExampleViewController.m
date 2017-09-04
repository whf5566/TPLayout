//
//  FrameExampleViewController.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/11.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleViewController.h"

@interface FrameExampleViewController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation FrameExampleViewController

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (self) {
        self.title = title;
        self.viewClass = viewClass;
    }

    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = [[self.viewClass alloc] initWithFrame:self.view.bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

@end
