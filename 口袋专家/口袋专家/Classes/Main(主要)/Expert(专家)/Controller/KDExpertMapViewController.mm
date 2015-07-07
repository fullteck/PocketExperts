//
//  ExpertMapViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertMapViewController.h"

#import <BaiduMapAPI/BMapKit.h>

#import "KDExpertList.h"

#import "KDMapView.h"

#import "KDExpertDetailViewController.h"

#import "AFNetworking.h"

#import "KDConst.h"

#import "KDSearchExpertViewController.h"

@interface KDExpertMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView * _mapView;
    
}
@property(nonatomic,strong)NSMutableArray * resultArray;//存放数据
@property(nonatomic,strong)NSMutableArray * annotationArr;//存放标注
@end

@implementation KDExpertMapViewController

- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (NSMutableArray *)annotationArr
{
    if (_annotationArr == nil) {
        _annotationArr = [NSMutableArray array];
    }
    return _annotationArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initWithMapView];
    
//    [self addAnnotation];
    
}
#pragma mark - 初始化地图
- (void)initWithMapView
{
    _mapView = [[BMKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    UIButton * buttomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buttomBtn.frame = CGRectMake(0, Height-60-64, Width, 60);
    buttomBtn.backgroundColor = [UIColor redColor];
    [buttomBtn setTitle:@"找专家" forState:UIControlStateNormal];
    [buttomBtn addTarget:self action:@selector(didClickSearchExpert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttomBtn];
}
#pragma mark - 查找专家
- (void)didClickSearchExpert:(UIButton *)button
{
    KDSearchExpertViewController * searchVC = [[KDSearchExpertViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - 在地图上显示专家
- (void)addAnnotation
{
    //先移除地图上已有的标注
    [_mapView removeAnnotations:self.annotationArr];
    [self.annotationArr removeAllObjects];

    //解析数据
    for (KDExpertList * expert in self.resultArray) {
        NSArray * ptArr = expert.geo;
        CLLocationDegrees latitude = [[ptArr objectAtIndex:0] doubleValue];
        CLLocationDegrees longitude = [[ptArr objectAtIndex:1] doubleValue];
        CLLocationCoordinate2D pt = CLLocationCoordinate2DMake(latitude,longitude);
        BMKPointAnnotation * annotion = [[BMKPointAnnotation alloc] init];
        annotion.coordinate = pt;
        annotion.title = [NSString stringWithFormat:@"%ld",expert._id];
        [self.annotationArr addObject:annotion];
    }
    NSLog(@"%ld",self.annotationArr.count);
    [_mapView addAnnotations:self.annotationArr];
    
}

#pragma mark - 根据地图上的标注自动显示可见范围(暂时不用)
// 设置地图当前显示的区域
- (void)setMapRegion:(NSArray * )arr
{
    if ([arr count]!=0) {
        // determine the extents of the trip points that were passed in, and zoom in to that area.
        CLLocationDegrees maxLat = -90;
        CLLocationDegrees maxLng = -180;
        CLLocationDegrees minLat = 90;
        CLLocationDegrees minLng = 180;
        
        for(int i = 0; i < [arr count]; i++)
        {
            CLLocation *currentLocation = [arr objectAtIndex:i];
            if(currentLocation.coordinate.latitude > maxLat)
                maxLat = currentLocation.coordinate.latitude;
            if(currentLocation.coordinate.latitude < minLat)
                minLat = currentLocation.coordinate.latitude;
            if(currentLocation.coordinate.longitude > maxLng)
                maxLng = currentLocation.coordinate.longitude;
            if(currentLocation.coordinate.longitude < minLng)
                minLng = currentLocation.coordinate.longitude;
        }
        
        BMKCoordinateRegion region;
        region.center.latitude = (maxLat + minLat) / 2;
        region.center.longitude = (maxLng + minLng) / 2;
        region.span.latitudeDelta = maxLat - minLat;
        region.span.longitudeDelta = maxLng - minLng;
        BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
        [_mapView setRegion:adjustedRegion];
    }
}
#pragma mark - 点击地图上的空白搜索附近的专家(测试用)
- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    NSLog(@"%lf,%lf",coordinate.latitude,coordinate.longitude);
    CLLocationDegrees latitude =  coordinate.latitude;
    CLLocationDegrees longitude = coordinate.longitude;
    [self getDataWithLatitude:longitude andLongitude:latitude];
    
}
//根据经纬度搜索专家
- (void)getDataWithLatitude:(CLLocationDegrees)latitude andLongitude:(CLLocationDegrees)longitude
{

    NSString * str = [NSString stringWithFormat:@"http://182.254.221.13:8080/api/v1.0/expert/list/%lf/%lf",latitude,longitude];
    NSLog(@"%@",str);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self.resultArray removeAllObjects];
        NSDictionary * dic = (NSDictionary *)responseObject;
        NSArray * expertListArray = [dic objectForKey:@"list"];
        for (NSDictionary * expertDic in expertListArray) {
            KDExpertList * expert = [[KDExpertList alloc] init];
            [expert setValuesForKeysWithDictionary:expertDic];
            [self.resultArray addObject:expert];
            
        }
        NSLog(@"%ld",self.resultArray.count);
        [self addAnnotation];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    

}

#pragma mark - BMKMapViewDelegate
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]){
        // 生成重用标示identifier
        NSString *AnnotationViewID = @"xidanMark";
        // 检查是否有重用的缓存
        BMKAnnotationView* annotationView = [view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        // 缓存没有命中，自己构造一个，一般首次添加annotation代码会运行到此处
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            ((BMKPinAnnotationView*)annotationView).pinColor = BMKPinAnnotationColorRed;
            // 设置重天上掉下的效果(annotation)
            ((BMKPinAnnotationView*)annotationView).animatesDrop = YES;
        }
        // 设置位置
        annotationView.centerOffset = CGPointMake(0, -(annotationView.frame.size.height * 0.5));
        annotationView.annotation = annotation;
        // 单击弹出泡泡，弹出泡泡前提annotation必须实现title属性
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"iconfont-zhuanjiaku.png"];
        //创建弹出的paopaoview
        KDMapView * view = [[KDMapView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
        view.detailButton.tag = [annotation.title integerValue];
        [view.detailButton addTarget:self action:@selector(didClickEnterDetail:) forControlEvents:UIControlEventTouchUpInside];
        BMKActionPaopaoView *paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:view];
        paopaoView.frame = CGRectMake(0, 0, 150, 100);
        annotationView.paopaoView = paopaoView;
//         设置是否可以拖拽
        annotationView.draggable = NO;
        return annotationView;

    }
    return nil;

}
#pragma mark - 点击进入专家详情
- (void)didClickEnterDetail:(UIButton *)button
{
    NSInteger expertId = button.tag;//通过tag值获取专家的id
    KDExpertDetailViewController * detailVC = [[KDExpertDetailViewController alloc] init];
    detailVC.urlId = expertId;
    [detailVC setHidesBottomBarWhenPushed:YES];

    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - 点击标注
- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view
{
    BMKPointAnnotation * annotation = (BMKPointAnnotation *)view.annotation;
    
    [_mapView setCenterCoordinate:annotation.coordinate animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _mapView.delegate  = self;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _mapView.delegate = nil;
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
