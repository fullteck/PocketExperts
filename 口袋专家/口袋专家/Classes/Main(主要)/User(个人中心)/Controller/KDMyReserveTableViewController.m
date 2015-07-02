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

@interface KDMyReserveTableViewController ()

@property(nonatomic,strong)NSMutableArray * resultArray;

@end

@implementation KDMyReserveTableViewController

- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildTableHeaderView];
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
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"expertList";
    BOOL nibResgistered = NO;
    if (!nibResgistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDMyReserveCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        nibResgistered = YES;
    }
    KDMyReserveCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    return cell;
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
