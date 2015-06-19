//
//  RootViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "RootViewController.h"
#import "KDExpertViewController.h"
#import "KDDiscoverTableViewController.h"
#import "KDConst.h"

@interface RootViewController (){
    KDExpertViewController * _expertVC;
    KDDiscoverTableViewController * _discoverTVC;
    UISegmentedControl * _segmentedC;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingTitleView];
}

#pragma mark - 设置 TitleView
- (void)settingTitleView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _segmentedC = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"专家",@"发现", nil]];
    
    _segmentedC.bounds = CGRectMake(0, 0, 200, 30);
    
    _segmentedC.selectedSegmentIndex = 0;
    
    [_segmentedC addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = _segmentedC;
    
    //将专家和发现两个视图添加到视图容器控制器
    _expertVC = [[KDExpertViewController alloc] init];
    
    _expertVC.view.frame = CGRectMake(0, 44, ScreenW, ScreenH);
    
    _discoverTVC = [[KDDiscoverTableViewController alloc] init];
    
    _discoverTVC.tableView.frame = CGRectMake(0, 44, ScreenW, ScreenH);
    
    [self addChildViewController:_expertVC];
    [self addChildViewController:_discoverTVC];
    
    [self.view addSubview:_expertVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - segment 的点击事件
- (void)changePage:(UISegmentedControl *)seg
{
    NSInteger Index = seg.selectedSegmentIndex;
    
    switch (Index) {
            
        case 0:
            
            [self selectOneView];
            
            break;
            
        case 1:
            
            [self selectTwoView];
            
            break;
            
        default:
            
            break;
            
    }
}
#pragma mark - 选择第一个视图
- (void)selectOneView
{
    if (_expertVC.view.superview == nil) {
        [self.view addSubview:_expertVC.view];
        [_discoverTVC.view removeFromSuperview];
    }
}
#pragma mark - 选择第二个视图
- (void)selectTwoView
{
    if (_discoverTVC.view.superview == nil) {
        [self.view addSubview:_discoverTVC.view];
        [_expertVC.view removeFromSuperview];
    }
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
