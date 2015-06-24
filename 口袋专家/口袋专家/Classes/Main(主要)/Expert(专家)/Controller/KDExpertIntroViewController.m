//
//  KDExpertIntroViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertIntroViewController.h"
#import "KDExpertIntroHeader.h"
#import "KDExpertJobCell.h"
#import "KDExpertEduCell.h"
@interface KDExpertIntroViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * introTableView;
@property(nonatomic,strong)NSMutableArray * resultArray;
@end

@implementation KDExpertIntroViewController
//懒加载
- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildTableView];
}
#pragma mark---创建tableView
- (void)buildTableView
{
    self.introTableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    _introTableView.delegate = self;
    _introTableView.dataSource = self;
    [self.view addSubview:_introTableView];
    _introTableView.tableHeaderView = [KDExpertIntroHeader instance];
}
#pragma mark---tableView协议中的方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * identifier = @"job";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertJobCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDExpertJobCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//        KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//        cell.topic = topic;
        return cell;
    }else{
            static NSString * identifier = @"edu";
            BOOL nibResgistered = NO;
            if (!nibResgistered) {
                UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertEduCell class]) bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identifier];
                nibResgistered = YES;
            }
            KDExpertEduCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//            KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
//            cell.topic = topic;
            return cell;

    }

    
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 100;
    }
}
//区头的名字
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"工作经历";
    }else{
        return @"教育背景";
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
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
