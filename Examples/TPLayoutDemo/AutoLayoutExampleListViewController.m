//
//  AutoLayoutExampleListViewController.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/11.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "AutoLayoutExampleListViewController.h"
#import "AutoLayoutExampleViewController.h"

#import "MASExampleBasicView.h"
#import "MASExampleConstantsView.h"
#import "MASExampleSidesView.h"
#import "MASExampleAnimatedView.h"
#import "MASExampleDebuggingView.h"
#import "MASExampleLabelView.h"
#import "MASExampleUpdateView.h"
#import "MASExampleRemakeView.h"
#import "MASExampleScrollView.h"
#import "MASExampleArrayView.h"
#import "MASExampleAttributeChainingView.h"
#import "MASExampleAspectFitView.h"
#import "MASExampleMarginView.h"
//#import "MASExampleDistributeView.h"
#import "MASExampleLayouGuideView.h"

static NSString *const kCellReuseIdentifier = @"kCellReuseIdentifier";

@interface AutoLayoutExampleListViewController ()
@property (nonatomic, strong) NSArray *exampleControllers;
@end

@implementation AutoLayoutExampleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"AutoLayout Examples";
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
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Basic"
                                                         viewClass:MASExampleBasicView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Update Constraints"
                                                         viewClass:MASExampleUpdateView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Remake Constraints"
                                                         viewClass:MASExampleRemakeView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Using Constants"
                                                         viewClass:MASExampleConstantsView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Composite Edges"
                                                         viewClass:MASExampleSidesView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Aspect Fit"
                                                         viewClass:MASExampleAspectFitView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Basic Animated"
                                                         viewClass:MASExampleAnimatedView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Debugging Helpers"
                                                         viewClass:MASExampleDebuggingView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Bacony Labels"
                                                         viewClass:MASExampleLabelView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"UIScrollView"
                                                         viewClass:MASExampleScrollView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Array"
                                                         viewClass:MASExampleArrayView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Attribute Chaining"
                                                         viewClass:MASExampleAttributeChainingView.class],
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"Margins"
                                                         viewClass:MASExampleMarginView.class],            
            [[AutoLayoutExampleViewController alloc] initWithTitle:@"UILayoutGuide "
                                                                     viewClass:MASExampleLayouGuideView.class],
        ];
    }

    return _exampleControllers;
}

@end
