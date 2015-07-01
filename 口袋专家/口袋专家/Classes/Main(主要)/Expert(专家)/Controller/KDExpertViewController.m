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

#import "KDConst.h"

#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件

@interface KDExpertViewController ()<BMKLocationServiceDelegate>
{
    BMKLocationService *_locService;

}
@property(nonatomic,strong)KDExpertListTableViewController *listTVC;
@property(nonatomic,strong)KDExpertMapViewController *mapVC;

@property(nonatomic,strong)NSMutableArray * expertArray;//存放数据
@property(nonatomic,strong)BMKUserLocation * userLocation;

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
- (BMKUserLocation *)userLocation
{
    if (_userLocation == nil) {
        _userLocation = [[BMKUserLocation alloc] init];
    }
    return _userLocation;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"专家";
    
    
    [self startLocation];

    [self getDataFromNetwork];

    [self addChildController];
}

- (void)startLocation
{
    //设置定位精确度，默认：kCLLocationAccuracyBest
    [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
    [BMKLocationService setLocationDistanceFilter:100.f];
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
}

- (void)addChildController
{
    //将专家列表和专家地图两个视图添加到视图容器控制器
    self.listTVC = [[KDExpertListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    NSLog(@"%ld",self.expertArray.count);
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

#pragma mark - BMKUserLocationDetegate
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

@end
