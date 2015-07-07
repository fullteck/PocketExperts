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
@interface KDRootViewController ()

@end

@implementation KDRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildTabBarController];
}

- (void)buildTabBarController
{
    //创建专家视图控制器
    KDExpertViewController * expertVC = [[KDExpertViewController alloc] init];
    expertVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"专家" image:[UIImage imageNamed:@"iconfont-zhuanjiaku"] tag:100];
    UINavigationController * NC1 = [[UINavigationController alloc] initWithRootViewController:expertVC];
    
    //创建发现视图控制器
    KDDiscoverTableViewController * disCoverTVC = [[KDDiscoverTableViewController alloc] initWithStyle:UITableViewStylePlain];
    disCoverTVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"iconfont-faxian"] tag:101];
    disCoverTVC.automaticallyAdjustsScrollViewInsets = YES;
    UINavigationController * NC2 = [[UINavigationController alloc] initWithRootViewController:disCoverTVC];
    
    //添加个人中心视图控制器
    LeftViewController * leftVC = [[LeftViewController alloc] init];
    leftVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"iconfont-gerenzhongxin"] tag:102];
    UINavigationController * NC3 = [[UINavigationController alloc] initWithRootViewController:leftVC];
    
    //添加到 tabbar
    self.viewControllers =  @[NC1,NC2,NC3];
    
}
@end
