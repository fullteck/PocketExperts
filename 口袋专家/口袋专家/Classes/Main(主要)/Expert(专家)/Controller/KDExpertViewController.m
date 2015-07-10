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
#import "AFNetworking.h"
#import "KDExpertList.h"
#import "KDConst.h"
#import "KDSearchExpertViewController.h"
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件



@interface KDExpertViewController ()<BMKLocationServiceDelegate,KDSearchExpertOnMap>
{
    BMKLocationService *_locService;
    UIBarButtonItem *_rightItem;
    UIBarButtonItem *_ListItem;
    UIBarButtonItem *_tempItem;

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
    
    [self buildBarButtonItem];
    
    [self startLocation];

    [self getDataFromNetwork];

    [self addChildController];
}

- (void)buildBarButtonItem
{
    _rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"map"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeMapPage:)];
    self.navigationItem.rightBarButtonItem = _rightItem;
    _ListItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"list"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeListPage:)];
}
//切换到地图模式
- (void)ChangeMapPage:(UIBarButtonItem *)BI
{
    if (_mapVC.view.superview == nil) {
        [self.view addSubview:_mapVC.view];
        [_listTVC.tableView removeFromSuperview];
        self.navigationItem.rightBarButtonItem = _ListItem;

        [self createTitleView];
    }

}
#pragma mark - 创建titleView
- (void)createTitleView
{
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 302.5, 30)];
    UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 302.5, 30)];
    backImage.image = [UIImage imageNamed:@"search box"];
    [titleView addSubview:backImage];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(27, 0, 302.5-27, 30)];
    label.text = @"找专家";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    [titleView addSubview:label];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect]
    ;
    button.frame = CGRectMake(0, 0, 302.5, 30);
    [button addTarget:self action:@selector(didClickEnterSearch:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:button];
    self.navigationItem.titleView = titleView;
}

#pragma mark - 点击进去搜专家界面
- (void)didClickEnterSearch:(UIButton *)button
{
    KDSearchExpertViewController * VC = [[KDSearchExpertViewController alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    VC.delegate = self.mapVC;
    [self.navigationController pushViewController:VC animated:NO];
}


//切换到列表模式
- (void)ChangeListPage:(UIBarButtonItem *)BI
{
    if (_listTVC.tableView.superview == nil) {
        [self.view addSubview:_listTVC.tableView];
        [_mapVC.view removeFromSuperview];
        self.navigationItem.rightBarButtonItem = _rightItem;
        self.navigationItem.titleView = nil;
    }

}

#pragma mark - 开始定位
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

#pragma mark - 把两个控制器添加到容器视图控制器中
- (void)addChildController
{
    //将专家列表和专家地图两个视图添加到视图容器控制器
    self.listTVC = [[KDExpertListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _listTVC.expertArray = self.expertArray;
    self.listTVC.view.frame = [[UIScreen mainScreen] bounds];
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
            [self.listTVC.tableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
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
