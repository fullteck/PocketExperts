//
//  KDExpertListTableViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertListTableViewController.h"
#import "AFNetworking.h"
#import "KDExpertList.h"
#import "KDExpertListCell.h"
#import "KDExpertDetailViewController.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height
#define kNetRequestUrl @"http://192.168.2.36:5000/api/v1.0/expert/list/23.4324324/32.3213213"

@interface KDExpertListTableViewController ()
@property(nonatomic,strong)NSMutableArray * expertArray;

@end

@implementation KDExpertListTableViewController
- (NSMutableArray *)expertArray
{
    if (_expertArray == nil) {
        _expertArray = [NSMutableArray array];
    }
    return _expertArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDataFromNetwork];
}
//获取专家
- (void)getDataFromNetwork
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kNetRequestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
        NSArray * expertListArray = [dic objectForKey:@"list"];
        for (NSDictionary * expertDic in expertListArray) {
            KDExpertList * expert = [[KDExpertList alloc] init];
            [expert setValuesForKeysWithDictionary:expertDic];
            [self.expertArray addObject:expert];
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark---tableView协议中的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.expertArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"expertList";
    BOOL nibResgistered = NO;
    if (!nibResgistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertListCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        nibResgistered = YES;
    }
    KDExpertListCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    KDExpertList * expert = [self.expertArray objectAtIndex:indexPath.row];
    cell.expert = expert;
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertDetailViewController * expertDetailVC = [[KDExpertDetailViewController alloc] init];
    KDExpertList * expert = [self.expertArray objectAtIndex:indexPath.row];
    expertDetailVC.urlId = expert._id;
    [self.navigationController pushViewController:expertDetailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
