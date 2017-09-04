//
//  MainViewController.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/7/7.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "MainViewController.h"
#import <TPLayout/TPLayout.h>
#import "AutoLayoutExampleListViewController.h"
#import "FrameExampleListViewController.h"

@interface TableviewCellData : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) dispatch_block_t clickAction;
@end

@implementation TableviewCellData
@end

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<TableviewCellData *> *dataList;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.navigationItem.title = @"Demo";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    self.tableView.tp_left = 0;
//    self.tableView.tp_rightResize = self.view.tp_right;
//    self.tableView.tp_top = 0;
//    self.tableView.tp_bottomResize = self.view.tp_bottom;
    
//    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
//    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
//    [self.view addConstraints:@[c1,c2]];
    
    self.tableView.al_width.equal(self.view);
    self.tableView.al_height.equal(self.view);
    self.tableView.al_centerX.equal(self.view);
    self.tableView.al_centerY.equal(self.view);
    
    NSLog(@"self.view.constraints %@", self.view.constraints);
    
    NSLog(@"tablveiew.constraints %@", self.tableView.constraints);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableviewCellData *data = self.dataList[indexPath.row];
    if (data.clickAction) {
        data.clickAction();
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellreuseIdentifier = @"_cellreuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellreuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellreuseIdentifier];
    }
    
    TableviewCellData *data = self.dataList[indexPath.row];
    cell.textLabel.text = data.title;
    return cell;
}


- (NSArray<TableviewCellData *> *)dataList {
    if (!_dataList) {
        __weak typeof(self) weakSelf = self;
        TableviewCellData *data1 = [[TableviewCellData alloc] init];
        data1.title = @"Frame Example";
        data1.clickAction = ^{
            UIViewController *vc =[[FrameExampleListViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        
        TableviewCellData *data2 = [[TableviewCellData alloc] init];
        data2.title = @"Autolayout Example";
        data2.clickAction = ^{
            UIViewController *vc =[[AutoLayoutExampleListViewController alloc] init];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _dataList = @[data1,data2];
    }
    return _dataList;
}


@end
