//
//  KDExpertsViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/6.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertsViewController.h"
#import "KDExpertListCell.h"
#import "KDExpertDetailViewController.h"

@interface KDExpertsViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 存储数据的数组 */
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation KDExpertsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐专家";
    
    self.tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSArray array];
    }
    return _dataArray;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KDExpertListCell *cell = [KDExpertListCell cellWithTableView:tableView];
    
    KDExpertList *expert = _dataArray[indexPath.row];
    
    cell.expert = expert;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    KDExpertList *expert = _dataArray[indexPath.row];
    
    KDExpertDetailViewController *expertDVC = [[KDExpertDetailViewController alloc] init];
    
    expertDVC.urlId = expert._id;
    
    [self.navigationController pushViewController:expertDVC animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
