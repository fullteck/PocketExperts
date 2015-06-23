//
//  ExpertViewController.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/4.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertViewController.h"
#import "KDExpertListTableViewController.h"
#import "KDExpertMapViewController.h"
#import "RootViewController.h"

@interface KDExpertViewController ()
@property(nonatomic,strong)KDExpertListTableViewController *listTVC;
@property(nonatomic,strong)KDExpertMapViewController *mapVC;
@end


@implementation KDExpertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"专家";
    
    
    //将专家列表和专家地图两个视图添加到视图容器控制器
    self.listTVC = [[KDExpertListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    self.mapVC = [[KDExpertMapViewController alloc] init];
    
    [self addChildViewController:self.listTVC];
    [self addChildViewController:self.mapVC];
    
    [self.view addSubview:self.listTVC.tableView];
}

- (void)KDRootViewControllerChangeStatus:(ExpertStatus)status
{
    switch (status) {
        case ExpertStatusList:
            if (self.listTVC.view.superview == nil) {
                [self.view addSubview:self.listTVC.view];
                [self.mapVC.view removeFromSuperview];
                [self.delegate KDExpertViewControllerNavigationBar:ExpertStatusList];
            }
            break;
        case ExpertStatusMap:
            if (self.mapVC.view.superview == nil) {
                [self.view addSubview:self.mapVC.view];
                [_listTVC.view removeFromSuperview];
                [self.delegate KDExpertViewControllerNavigationBar:ExpertStatusMap];
            }
            break;
    }
}
@end
