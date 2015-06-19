//
//  ExpertMapViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertMapViewController.h"
#import <QMapKit/QMapKit.h>

@interface KDExpertMapViewController ()<QMapViewDelegate>
@property (nonatomic, strong) QMapView *mapView;

@end

@implementation KDExpertMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView = [[QMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
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
