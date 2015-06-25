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
#import "KDExpertJob.h"
#import "KDExpertEdu.h"
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

    [self initWithData];

    [self buildTableView];
}

#pragma mark--解析数据
- (void)initWithData
{
    NSArray * jobArr = [_infoDic objectForKey:@"work"];
    NSMutableArray * jobArray = [NSMutableArray array];
    for (NSDictionary * jobDic in jobArr) {
        KDExpertJob * job = [[KDExpertJob alloc] init];
        [job setValuesForKeysWithDictionary:jobDic];
        [jobArray addObject:job];
    }
    //对工作经历根据时间进行排序
    [jobArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        KDExpertJob * job1 = (KDExpertJob *)obj1;
        KDExpertJob * job2 = (KDExpertJob *)obj2;
        if (job1.start>job2.start) {
            return NSOrderedAscending;
        }else if (job1.start == job2.start){
            return NSOrderedSame;
        }else{
            return NSOrderedDescending;
        }
        
    }];
    [self.resultArray addObject:jobArray];
    NSArray * eduArr = [_infoDic objectForKey:@"edu"];
    NSMutableArray * eduArray = [NSMutableArray array];
    for (NSDictionary * eduDic in eduArr) {
        KDExpertEdu * edu = [[KDExpertEdu alloc] init];
        [edu setValuesForKeysWithDictionary:eduDic];
        [eduArray addObject:edu];
    }
    //对教育经历根据时间进行排序
    [eduArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        KDExpertEdu * edu1 = (KDExpertEdu *)obj1;
        KDExpertEdu * edu2 = (KDExpertEdu *)obj2;
        if (edu1.start > edu2.start) {
            return NSOrderedAscending;
        }else if (edu1.start == edu2.start){
            return NSOrderedSame;
        }else{
            return NSOrderedDescending;
        }
    }];
    [self.resultArray addObject:eduArray];
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
#pragma mark---tableView协议中必须实现的方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.resultArray.count;//区
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.resultArray objectAtIndex:section] count];//行
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * identifier = @"work";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertJobCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDExpertJobCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        KDExpertJob * job = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.expertJob = job;
        
        return cell;
    }else{
            static NSString * identifier = @"education";
            BOOL nibResgistered = NO;
            if (!nibResgistered) {
                UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertEduCell class]) bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identifier];
                nibResgistered = YES;
            }
            KDExpertEduCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        KDExpertEdu * edu = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.edu = edu;
        return cell;

    }

    
}

#pragma mark----对区头区尾的一些设置
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
