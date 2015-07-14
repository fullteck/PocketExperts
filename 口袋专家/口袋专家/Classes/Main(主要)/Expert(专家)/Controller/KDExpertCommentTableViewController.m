//
//  KDExpertCommentTableViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertCommentTableViewController.h"
#import "KDExpertCommentCell.h"
#import "KDConst.h"
#import "KDHandle.h"

@interface KDExpertCommentTableViewController ()
@property(nonatomic,strong)NSMutableArray * resultArray;
@end

@implementation KDExpertCommentTableViewController

- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"评论";
    [self getNetworkRequest];
}
#pragma mark - 网络请求
- (void)getNetworkRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kCommentList parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * arr = responseObject[@"list"];
        for (NSDictionary * dic in arr) {
            KDExpertComment * comment = [[KDExpertComment alloc] init];
            [comment setValuesForKeysWithDictionary:dic];
            [self.resultArray addObject:comment];
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"===%@",error);
    }];
}

#pragma mark - Table view dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KDExpertCommentCell * cell = (KDExpertCommentCell *)[tableView dequeueReusableCellWithIdentifier:@"expertComment"];
    if (cell == nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertCommentCell" owner:self options:nil];
        cell = [arr lastObject];
    }
  
    KDExpertComment * comment = [self.resultArray objectAtIndex:indexPath.row];
    cell.comment = comment;
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [KDHandle shareInstance].cellHeight;
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
