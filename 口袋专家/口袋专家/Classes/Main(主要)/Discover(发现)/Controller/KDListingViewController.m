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
#define Width [[UIScreen mainScreen] bounds].size.width

@interface KDListingViewController ()
@property(nonatomic,strong)KDListingHeadView * listingHeadView;
@end

@implementation KDListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"清单";
    self.view.backgroundColor = [UIColor cyanColor];
    [self initWithTableView];
}

- (void)initWithTableView
{
    self.myTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    self.listingHeadView = [[KDListingHeadView alloc] initWithFrame:CGRectMake(0, 0, Width, 85)];
    _myTableView.tableHeaderView = _listingHeadView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDListingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"listing"];
    if (!cell) {
        cell = [[KDListingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listing"];
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    [cell.changeButton addTarget:self action:@selector(didClickChangeProfessor:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

- (void)didClickChangeProfessor:(UIButton *)button
{
    NSLog(@"换专家");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 360;
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
