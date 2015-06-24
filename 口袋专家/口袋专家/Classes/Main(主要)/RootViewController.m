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

@interface RootViewController ()<KDExpertViewControllerDelegate>{
    KDExpertViewController * _expertVC;
    KDDiscoverTableViewController * _discoverTVC;
    UISegmentedControl * _segmentedC;
    UIBarButtonItem *_rightItem;
    UIBarButtonItem *_ListItem;
    UIBarButtonItem *_tempItem;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingTopItem];
    
    [self settingTitleView];
    
    _tempItem = nil;
}
#pragma mark - 设置 item
- (void)settingTopItem
{
    UIBarButtonItem *userItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-gerenzhongxin"] style:UIBarButtonItemStyleDone target:self action:@selector(pushUserPage:)];
    self.navigationItem.leftBarButtonItem = userItem;
    
    _rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-ditu"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeMapPage:)];
    _ListItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-liebiao"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeListPage:)];
}
#pragma mark - 推出抽屉
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
    
    self.delegate =(id <KDRootViewControllerDelegate>)_expertVC;
    
    _expertVC.delegate = (id <KDExpertViewControllerDelegate>)self;
    
}
#pragma mark - KDExpertViewController 的 delegate 方法
- (void)KDExpertViewControllerNavigationBar:(ExpertStatus)status
{
    switch (status) {
        case ExpertStatusList:
            self.navigationItem.rightBarButtonItem =_rightItem;
            break;
        case ExpertStatusMap:
            self.navigationItem.rightBarButtonItem = _ListItem;
            break;
            
        default:
            break;
    }
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
        _tempItem = self.navigationItem.rightBarButtonItem;
        self.navigationItem.rightBarButtonItem = nil;
    }
}
#pragma mark - 选择第二个视图
- (void)selectTwoView
{
    if (_expertVC.view.superview == nil) {
        [self.view addSubview:_expertVC.view];
        [_discoverTVC.view removeFromSuperview];
        if (_tempItem == nil) {
            self.navigationItem.rightBarButtonItem = _rightItem;
        } else {
            self.navigationItem.rightBarButtonItem = _tempItem;
        }
    }
}

#pragma mark - 自己的代理方法
- (void)ChangeListPage:(UIBarButtonItem *)btn
{
    [self.delegate KDRootViewControllerChangeStatus:ExpertStatusList];
}

- (void)ChangeMapPage:(UIBarButtonItem *)btn
{
    [self.delegate KDRootViewControllerChangeStatus:ExpertStatusMap];
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
