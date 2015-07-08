//
//  KDRootViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDRootViewController.h"
#import "KDDiscoverTableViewController.h"
#import "KDExpertViewController.h"
#import "LeftViewController.h"
#import "KDConst.h"
#import "KDBaseNavigationController.h"
@interface KDRootViewController ()

@end

@implementation KDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTabBarController];
}

- (void)buildTabBarController
{
    KDExpertViewController * expertVC = [[KDExpertViewController alloc] init];
    expertVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"专家" image:[UIImage imageNamed:@"experts_normal"] tag:100];
    [expertVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"experts_selected"]];
    KDBaseNavigationController * NC1 = [[KDBaseNavigationController alloc] initWithRootViewController:expertVC];
    
    KDDiscoverTableViewController * disCoverTVC = [[KDDiscoverTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    disCoverTVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"found_normal"] tag:101];
    disCoverTVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"found_selected"] tag:101];
    KDBaseNavigationController * NC2 = [[KDBaseNavigationController alloc] initWithRootViewController:disCoverTVC];
    
    LeftViewController * leftVC = [[LeftViewController alloc] init];
    leftVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"my_normal"] tag:102];
    [leftVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"my_selected"]];
    KDBaseNavigationController * NC3 = [[KDBaseNavigationController alloc] initWithRootViewController:leftVC];
    self.viewControllers =  @[NC2,NC1,NC3];
    
    
}
@end
