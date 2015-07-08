//
//  ListingViewController.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingViewController.h"
#import "KDListingHeadView.h"
#import "KDListingCell.h"
#import "KDListModel.h"
#import "KDConst.h"
#import "UIBarButtonItem+Extension.h"
#import "KDExpertsViewController.h"

@interface KDListingViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_myTableView;
}
@property(nonatomic,strong)KDListingHeadView * listingHeadView;
/** 存储清单数据的字典 */
@property(nonatomic,strong)NSDictionary *listDic;
/** 存储清单详情列表数据的数组 */
@property(nonatomic,strong)NSArray *dataArray;
/** 存储推荐专家数据的数组 */
@property(nonatomic,strong)NSArray *expertsArray;
@end

@implementation KDListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"清单";
    [self initWithTableView];
    [self loadData];
}
#pragma mark - 初始化 tableView
- (void)initWithTableView {
    _myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _myTableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    
    /** 设置 UIBarButtonItem */
    UIBarButtonItem *leftBtn = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"back" highImage:@"back"];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    /** 设置 HeadView */
    self.listingHeadView = [KDListingHeadView instance];
    _myTableView.tableHeaderView = _listingHeadView;
    _myTableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 加载数据
- (void)loadData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:URL_List parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dic = responseObject[INV];
            self.listDic = dic;
            self.listingHeadView.titleLabel.text = self.listDic[@"title"];
            
            NSArray *dataArray = [KDListModel objectArrayWithKeyValuesArray:dic[INVTOPIC]];
            self.dataArray = dataArray;
            dispatch_async(dispatch_get_main_queue(), ^{
                [_myTableView reloadData];
            });
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }
        }];
    });
}
#pragma mark - 懒加载
- (NSDictionary *)listDic {
    if (_listDic == nil) {
        _listDic = [NSDictionary dictionary];
    }
    return _listDic;
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

- (NSArray *)expertsArray {
    if (_expertsArray == nil) {
        _expertsArray = [NSArray array];
    }
    return _expertsArray;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KDListingCell * cell = [KDListingCell cellWithTableView:tableView];
    KDListModel *list = self.dataArray[indexPath.row];
    
    cell.list = list;
    [cell addTarget:self action:@selector(pushToExperts)];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KDListModel *listModel = self.dataArray[indexPath.row];
    CGFloat height = [KDListingCell cellWithHeight:listModel.content];
    return height + 130.0f;
}
#pragma mark - 专家列表按钮点击事件
- (void)pushToExperts {
    NSLog(@"按钮被点击了!");
    KDExpertsViewController *expertsVC = [[KDExpertsViewController alloc] init];
    expertsVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:expertsVC] animated:YES completion:nil];
}

@end
