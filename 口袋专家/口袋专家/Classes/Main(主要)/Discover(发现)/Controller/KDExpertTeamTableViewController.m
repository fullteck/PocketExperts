//
//  KDExpertTeamTableViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTeamTableViewController.h"
#import "KDExpertTeamTableViewCell.h"
#import "KDExpertTDetailTableViewCell.h"
#import "KDExpertHeaderView.h"
#import "KDSectionHeaderView.h"
#import "KDExpertsTableViewController.h"

@interface KDExpertTeamTableViewController ()

@end

@implementation KDExpertTeamTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingHeadView];
}
#pragma mark - 设置HeadView
- (void)settingHeadView {
    KDExpertHeaderView *headerView = [KDExpertHeaderView expertHeader];
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.row == 0) {
        KDExpertTeamTableViewCell *cell = [KDExpertTeamTableViewCell cellWithTableView:tableView];
        return cell;
    } else {
        KDExpertTDetailTableViewCell *cell = [KDExpertTDetailTableViewCell cellWithTableView:tableView];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 300;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        KDSectionHeaderView *sectionView = [KDSectionHeaderView sectionHeader];
        [sectionView addTarget:self action:@selector(pushExpertTeam)];
        return sectionView;
}

- (void)pushExpertTeam {
    KDExpertsTableViewController *expertsTVC = [[KDExpertsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:expertsTVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
@end
