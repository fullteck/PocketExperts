//
//  ExpertMapViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertMapViewController.h"
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件
#import "KDExpertList.h"
#import "KDMapView.h"

@interface KDExpertMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapView * _mapView;
    
}

@end

@implementation KDExpertMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initWithMapView];
    [self addAnnotation];
    
}
#pragma mark - 初始化地图
- (void)initWithMapView
{
    _mapView = [[BMKMapView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [_mapView setZoomLevel:16];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
}

#pragma mark - 在地图上显示专家
- (void)addAnnotation
{
    NSMutableArray * arr = [NSMutableArray array];
    for (KDExpertList * expert in _expertArray) {
        NSArray * ptArr = expert.geo;
        CLLocationDegrees latitude = [[ptArr objectAtIndex:0] doubleValue];
        CLLocationDegrees longitude = [[ptArr objectAtIndex:1] doubleValue];
        CLLocationCoordinate2D pt = CLLocationCoordinate2DMake(latitude,longitude);
        BMKPointAnnotation * annotion = [[BMKPointAnnotation alloc] init];
        annotion.coordinate = pt;
        annotion.title = expert.name;
        [arr addObject:annotion];
    }
    NSLog(@"%ld",arr.count);
    [_mapView addAnnotations:arr];
    
}

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
        KDMapView * view = [[KDMapView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
        BMKActionPaopaoView *paopaoView = [[BMKActionPaopaoView alloc] initWithCustomView:view];
        paopaoView.frame = CGRectMake(0, 0, 150, 100);
        annotationView.paopaoView = paopaoView;
//         设置是否可以拖拽
        annotationView.draggable = NO;
        return annotationView;

    }
    return nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    _mapView.delegate  = self;
    
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
