//
//  KDMyReserveTableViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/2.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDMyReserveTableViewController.h"

#import "KDConst.h"

#import "KDMyReserveCell.h"

#import "KDMyReserve.h"

#import "KDReserveDetailViewController.h"

@interface KDMyReserveTableViewController ()

@property(nonatomic,strong)NSMutableArray * resultArray;//数据源
@property(nonatomic,strong)NSMutableDictionary * dic;
@end

@implementation KDMyReserveTableViewController
//懒加载
- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}
- (NSMutableDictionary *)dic
{
    if (_dic == nil) {
        _dic = [NSMutableDictionary dictionary];
    }
    return _dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dic setObject:@1 forKey:@"type"];
    [self buildTableHeaderView];
    [self initWithData];
}

- (void)initWithData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kMyReserve parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray * listArray = responseObject[@"list"];
        for (NSDictionary * dic in listArray) {
            KDMyReserve * reserve = [[KDMyReserve alloc] init];
            [reserve setValuesForKeysWithDictionary:dic];
            [self.resultArray addObject:reserve];
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)buildTableHeaderView
{
    NSArray * arr = @[@"预约我的人",@"我约的专家"];
    UISegmentedControl * segmentControl = [[UISegmentedControl alloc] initWithItems:arr];
    segmentControl.frame = CGRectMake(0, 0, Width, 44);
    segmentControl.selectedSegmentIndex = 0;
    [segmentControl addTarget:self action:@selector(didClickChange:) forControlEvents:UIControlEventValueChanged];
    self.tableView.tableHeaderView = segmentControl;
}

//切换segment
- (void)didClickChange:(UISegmentedControl *)segmentControll
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"expertList";
    BOOL nibResgistered = NO;
    if (!nibResgistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDMyReserveCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        nibResgistered = YES;
    }
    
    KDMyReserve * reserve = [self.resultArray objectAtIndex:indexPath.row];
    KDMyReserveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.reserve = reserve;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDMyReserve * reserve = [self.resultArray objectAtIndex:indexPath.row];
    NSString * reserveId = reserve._id;
    [self.dic setObject:reserveId forKey:@"id"];
    KDReserveDetailViewController * reserveDetailVC = [[KDReserveDetailViewController alloc] init];
    reserveDetailVC.dic = self.dic;
    [self.navigationController pushViewController:reserveDetailVC animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
