//
//  KDRootViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDRootViewController.h"

#import "KDExpertViewController.h"

#import "KDDiscoverTableViewController.h"

#import "KDConst.h"

#import "LeftViewController.h"
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
    expertVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"专家" image:[UIImage imageNamed:@"iconfont-zhuanjiaku.png"] tag:100];
    UINavigationController * NC1 = [[UINavigationController alloc] initWithRootViewController:expertVC];
    
    KDDiscoverTableViewController * disCoverTVC = [[KDDiscoverTableViewController alloc] initWithStyle:UITableViewStylePlain];
    disCoverTVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"iconfont-faxian.png"] tag:101];
    UINavigationController * NC2 = [[UINavigationController alloc] initWithRootViewController:disCoverTVC];
    
    LeftViewController * leftVC = [[LeftViewController alloc] init];
    leftVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"iconfont-gerenzhongxin"] tag:102];
    UINavigationController * NC3 = [[UINavigationController alloc] initWithRootViewController:leftVC];
    self.viewControllers =  @[NC1,NC2,NC3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
