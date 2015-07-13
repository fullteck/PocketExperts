//
//  KDSearchListController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/10.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDSearchListController.h"
#import "AFNetworking.h"
#import "KDExpertList.h"
#import "KDExpertListCell.h"
#import "KDConst.h"

@interface KDSearchListController ()
@property(nonatomic,strong)NSMutableArray * resultarray;
@end

@implementation KDSearchListController
//懒加载
- (NSMutableArray *)resultarray
{
    if (_resultarray == nil) {
        _resultarray = [NSMutableArray array];
    }
    
    return _resultarray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self getRequestWithKeyStr];

}
#pragma mark - 发起网络请求
- (void)getRequestWithKeyStr
{
    NSString * str = [NSString stringWithFormat:@"http://192.168.2.36:5000/api/v1.0/expert/search?content=%@",_searchStr];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * listArr = responseObject[@"list"];
        self.resultarray = [KDExpertList objectArrayWithKeyValuesArray:listArr];
        NSLog(@"%@",responseObject);
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.resultarray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KDExpertList * expert = [self.resultarray objectAtIndex:indexPath.row];
    KDExpertListCell * cell = (KDExpertListCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"expertList"];
    if (cell == nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertListCell" owner:self options:nil];
        cell = [arr lastObject];
    }
    cell.expert = expert;
    return cell;
}



@end
