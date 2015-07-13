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
#import "KDMyReserveTableViewController.h"
#import "KDLeftHeaderView.h"
#import "KDBaseNavigationController.h"
#import "KDConst.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
/** 存储所有的 title */
@property (nonatomic, strong)NSArray *titleArray;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    NSArray *titleArray = @[@"我约的专家",@"我的智囊团",@"我的心愿单",@"我的钱包"];
    NSArray *otherTitleArray = @[@"成为专家",@"分享赚时间",@"帮助中心"];
    
    self.titleArray = @[titleArray,otherTitleArray];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        KDLeftHeaderView *headerView = [KDLeftHeaderView instance];
        [headerView addTarget:self action:@selector(login)];
        return headerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 200;
    }
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titleArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"an appointment of experts"];
        } else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"my think tank"];
        } else if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"my like"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"my wallet"];
        }
    } else {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"become an expert"];
        } else if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"share to make time"];
        } else {
            cell.imageView.image = [UIImage imageNamed:@"help center"];
        }
    }
        return cell;
}

- (void)login {
    NSLog(@"登录");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
            KDMyReserveTableViewController * myReserveTVC = [[KDMyReserveTableViewController alloc] initWithStyle:UITableViewStylePlain];
            KDBaseNavigationController *NC =[[KDBaseNavigationController alloc] initWithRootViewController:myReserveTVC];
            myReserveTVC.title = self.titleArray[indexPath.section][indexPath.row];
            
            [self presentViewController:NC animated:YES completion:nil];

}


@end
