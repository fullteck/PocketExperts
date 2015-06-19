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
#import "LeftViewController.h"
#import "PPRevealSideViewController.h"

@interface RootViewController (){
    KDExpertViewController * _expertVC;
    KDDiscoverTableViewController * _discoverTVC;
    UISegmentedControl * _segmentedC;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingTopItem];
    
    [self settingTitleView];
}
#pragma mark - 设置 item
- (void)settingTopItem
{
    UIBarButtonItem *userItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-gerenzhongxin"] style:UIBarButtonItemStyleDone target:self action:@selector(pushUserPage:)];
    self.navigationItem.leftBarButtonItem = userItem;
}

- (void)pushUserPage:(UIBarButtonItem *)item
{
    LeftViewController *configureVieController = [[LeftViewController alloc] init];
    
    [self.revealSideViewController pushViewController:configureVieController
                                          onDirection:PPRevealSideDirectionLeft
                                           withOffset:CGRectGetWidth(self.view.bounds) / 5.0f
                                             animated:YES];
}

#pragma mark - 设置 TitleView
- (void)settingTitleView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _segmentedC = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"发现",@"专家", nil]];
    
    _segmentedC.bounds = CGRectMake(0, 0, 200, 30);
    
    [_segmentedC addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = _segmentedC;
    
    //将专家和发现两个视图添加到视图容器控制器
    _expertVC = [[KDExpertViewController alloc] init];
    
    _expertVC.view.frame = CGRectMake(0, 0, ScreenW, ScreenH);
    
    _discoverTVC = [[KDDiscoverTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _discoverTVC.tableView.frame = CGRectMake(0, 0, ScreenW, ScreenH);

    
    [self addChildViewController:_expertVC];
    [self addChildViewController:_discoverTVC];
    
    [self.view addSubview:_discoverTVC.view];
    
    _segmentedC.selectedSegmentIndex = 0;
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
    if (_discoverTVC.view.superview == nil) {
        [self.view addSubview:_discoverTVC.view];
        [_expertVC.view removeFromSuperview];
    }
}
#pragma mark - 选择第二个视图
- (void)selectTwoView
{
    if (_expertVC.view.superview == nil) {
        [self.view addSubview:_expertVC.view];
        [_discoverTVC.view removeFromSuperview];
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
