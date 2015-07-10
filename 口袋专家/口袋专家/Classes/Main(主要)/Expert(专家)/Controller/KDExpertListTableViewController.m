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

#import "KDHandle.h"

#import "KDConst.h"

@interface KDExpertListTableViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * kindScrollView;
@end

@implementation KDExpertListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createTableHeaderView];
}
//创建scrollView
- (void)createTableHeaderView
{
    
    NSArray * kindArray = @[@"全部",@"媒体",@"自媒体",@"营销",@"产品",@"设计"];
    self.kindScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, 42)];
    _kindScrollView.contentSize = CGSizeMake(Width/5*6, 0);
    self.tableView.tableHeaderView = _kindScrollView;
    _kindScrollView.delegate = self;
    for (int i = 0; i < kindArray.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(Width/5*i, 0, Width/5, 42);
        [button setTitle:[kindArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(didClickChangeKind:) forControlEvents:UIControlEventTouchUpInside];
        [_kindScrollView addSubview:button];
        
    }
}

- (void)didClickChangeKind:(UIButton *)button
{
    NSLog(@"===");
}

#pragma mark---tableView协议中的方法
//numberOfRow
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _expertArray.count;
}
//cellForRow
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertList * expert = [_expertArray objectAtIndex:indexPath.row];
    KDExpertListCell * cell = (KDExpertListCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"expertList"];
    if (cell == nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertListCell" owner:self options:nil];
        cell = [arr lastObject];
    }
    cell.expert = expert;
    return cell;
    
}

//heightForRow
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",[KDHandle shareInstance].cellHeight);
    return [KDHandle shareInstance].cellHeight;
}
//didSelectRow
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertDetailViewController * expertDetailVC = [[KDExpertDetailViewController alloc] init];
    KDExpertList * expert = [_expertArray objectAtIndex:indexPath.row];
    expertDetailVC.urlId = expert._id;
    [expertDetailVC setHidesBottomBarWhenPushed:YES];
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
