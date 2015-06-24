//
//  LeftViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "LeftViewController.h"
#import "KDLeftHeadTableViewCell.h"
#import "KDLeftSwitchTableViewCell.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain)UITableView *tableView;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 640) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    } else if (indexPath.row == 1) {
        return 90;
    } else {
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        KDLeftHeadTableViewCell *cell = [KDLeftHeadTableViewCell instance];
        return cell;
    } else if (indexPath.row == 1) {
        KDLeftSwitchTableViewCell *cell = [KDLeftSwitchTableViewCell instance];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.text = @"个人中心";
        
        return cell;
    }
}
@end
