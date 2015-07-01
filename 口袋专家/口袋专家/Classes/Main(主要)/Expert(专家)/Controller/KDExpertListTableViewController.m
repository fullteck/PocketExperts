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

#import "KDConst.h"


@interface KDExpertListTableViewController ()

@end

@implementation KDExpertListTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

#pragma mark---tableView协议中的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%ld",_expertArray.count);
    return _expertArray.count;
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
    KDExpertList * expert = [_expertArray objectAtIndex:indexPath.row];
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
    KDExpertList * expert = [_expertArray objectAtIndex:indexPath.row];
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
