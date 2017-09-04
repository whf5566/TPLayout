//
//  FrameExampleListViewController.h
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/11.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "FrameExampleListViewController.h"
#import "FrameExampleViewController.h"

#import "FrameExampleBasicView.h"
#import "FrameExampleConstantsView.h"
#import "FrameExampleSidesView.h"
#import "FrameExampleAnimatedView.h"
#import "FrameExampleUpdateView.h"
#import "FrameExampleRemakeView.h"
#import "FrameExampleScrollView.h"
#import "FrameExampleArrayView.h"
#import "FrameExampleAspectFitView.h"
#import "FrameExampleMarginView.h"

static NSString *const kCellReuseIdentifier = @"kCellReuseIdentifier";

@interface FrameExampleListViewController ()
@property (nonatomic, strong) NSArray *exampleControllers;
@end

@implementation FrameExampleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Frame Examples";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (NSArray *)exampleControllers {
    if (_exampleControllers == nil) {
        _exampleControllers = @[
            [[FrameExampleViewController alloc] initWithTitle:@"Basic"
                                                         viewClass:FrameExampleBasicView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Update Constraints"
                                                         viewClass:FrameExampleUpdateView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Remake Constraints"
                                                         viewClass:FrameExampleRemakeView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Using Constants"
                                                         viewClass:FrameExampleConstantsView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Composite Edges"
                                                         viewClass:FrameExampleSidesView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Aspect Fit"
                                                         viewClass:FrameExampleAspectFitView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Basic Animated"
                                                         viewClass:FrameExampleAnimatedView.class],
//            [[FrameExampleViewController alloc] initWithTitle:@"Debugging Helpers"
//                                                         viewClass:FrameExampleDebuggingView.class],
//            [[FrameExampleViewController alloc] initWithTitle:@"Bacony Labels"
//                                                         viewClass:FrameExampleLabelView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"UIScrollView"
                                                         viewClass:FrameExampleScrollView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Array"
                                                         viewClass:FrameExampleArrayView.class],
//            [[FrameExampleViewController alloc] initWithTitle:@"Attribute Chaining"
//                                                         viewClass:FrameExampleAttributeChainingView.class],
            [[FrameExampleViewController alloc] initWithTitle:@"Margins"
                                                         viewClass:FrameExampleMarginView.class],
//            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Views Distribute"
//                                                         viewClass:FrameExampleDistributeView.class],
        ];
    }

    return _exampleControllers;
}

@end
