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
#import "AFNetworking.h"
#import "KDExpertList.h"
#define kNetRequestUrl @"http://192.168.2.36:5000/api/v1.0/expert/list/23.4324324/32.3213213"
@interface KDExpertViewController ()
@property(nonatomic,strong)KDExpertListTableViewController *listTVC;
@property(nonatomic,strong)KDExpertMapViewController *mapVC;

@property(nonatomic,strong)NSMutableArray * expertArray;

@end


@implementation KDExpertViewController
//懒加载
- (NSMutableArray *)expertArray
{
    if (_expertArray == nil) {
        _expertArray = [NSMutableArray array];
    }
    return _expertArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"专家";
    [self getDataFromNetwork];

    [self addChildController];
}

- (void)addChildController
{
    //将专家列表和专家地图两个视图添加到视图容器控制器
    self.listTVC = [[KDExpertListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _listTVC.expertArray = self.expertArray;
    self.listTVC.view.frame = CGRectMake(0, 0, 375, 667);
    self.mapVC = [[KDExpertMapViewController alloc] init];
    _mapVC.expertArray = self.expertArray;
    [self addChildViewController:self.listTVC];
    [self addChildViewController:self.mapVC];
    
    [self.view addSubview:self.listTVC.tableView];

}

#pragma mark - 网络请求
- (void)getDataFromNetwork
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kNetRequestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
        NSArray * expertListArray = [dic objectForKey:@"list"];
        for (NSDictionary * expertDic in expertListArray) {
            KDExpertList * expert = [[KDExpertList alloc] init];
            [expert setValuesForKeysWithDictionary:expertDic];
            [self.expertArray addObject:expert];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
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
