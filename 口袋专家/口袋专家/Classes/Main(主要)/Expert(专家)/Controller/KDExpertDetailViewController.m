//
//  KDExpertDetailViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertDetailViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "KDExpertTopicCell.h"
#import "KDExpertIntroCell.h"
#import "KDExpertCommentCell.h"
#import "KDExpertList.h"
#import "KDExpertComment.h"
#import "KDExpertTopic.h"
#import "UIImageView+WebCache.h"
#import "KDHeader.h"
#import "KDTopicDetailViewController.h"
#import "KDExpertCommentTableViewController.h"
#import "KDExpertIntroViewController.h"
#import "KDReserveController.h"

#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

@interface KDExpertDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * detailTableView;
@property(nonatomic,strong)NSMutableArray * resultArray;
@property(nonatomic,strong)NSMutableDictionary * dic;

@end



@implementation KDExpertDetailViewController
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
    self.navigationItem.title = @"专家详情";
    UIBarButtonItem * BI = [[UIBarButtonItem alloc] initWithTitle:@"预约" style:UIBarButtonItemStyleDone target:self action:@selector(didClickReserve:)];
    self.navigationItem.rightBarButtonItem = BI;
    [self initWithTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getNetworkWithUrl];
}
//点击预约按钮
- (void)didClickReserve:(UIBarButtonItem *)BI
{
    NSLog(@"点击了预约");
    KDReserveController * reserveVC = [[KDReserveController alloc] init];
    [self.navigationController pushViewController:reserveVC animated:YES];
    
    

}

#pragma mark---initTableView
- (void)initWithTableView
{
    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    [self.view addSubview:_detailTableView];
    self.detailTableView.tableHeaderView = [KDHeader instance];
}
#pragma mark-----NetWork
- (void)getNetworkWithUrl
{
    NSString * headStr = @"http://192.168.2.36:5000";
    NSString * footStr = [NSString stringWithFormat:@"/api/v1.0/expert/info/%d",40];
    NSString * str = [headStr stringByAppendingString:footStr];
    NSLog(@"%@",str);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary * dic = responseObject[@"expert"];
        self.dic = dic[@"info"];
        NSArray * topicArray = dic[@"topic"];
        NSMutableArray * topicArr = [NSMutableArray array];
        for (NSDictionary * dic1 in topicArray) {
            NSLog(@"%@",dic1);
            KDExpertTopic * topic = [[KDExpertTopic alloc] init];
            [topic setValuesForKeysWithDictionary:dic1];
            [topicArr addObject:topic];
        }
        NSLog(@"!!!%@",topicArr);
        [self.resultArray addObject:topicArr];
        NSDictionary * introDic = dic[@"info"];
        KDExpertList * expert = [[KDExpertList alloc] init];
        [expert setValuesForKeysWithDictionary:introDic];
        NSArray * introArr = [NSArray arrayWithObject:expert];
        [self.resultArray addObject:introArr];
        NSArray * commentArray = dic[@"comment"];
        NSMutableArray * commentArr = [NSMutableArray array];
        for (NSDictionary * dic2 in commentArray) {
            KDExpertComment * comment = [[KDExpertComment alloc] init];
            [comment setValuesForKeysWithDictionary:dic2];
            [commentArr addObject:comment];
        }
        [self.resultArray addObject:commentArr];
        NSLog(@"%@",self.resultArray);
        [self.detailTableView reloadData];
        KDHeader * header = (KDHeader *)self.detailTableView.tableHeaderView;
        header.expert = [[self.resultArray objectAtIndex:1] objectAtIndex:0];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}
#pragma mark---tableView协议中的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.resultArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arr = [self.resultArray objectAtIndex:section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * identifier = @"topic";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertTopicCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDExpertTopicCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.topic = topic;
        return cell;
    }else if (indexPath.section == 1){
        static NSString * identifier = @"intro";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertIntroCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDExpertIntroCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    KDExpertList * expert = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]
        ;
        [cell.introducepic sd_setImageWithURL:[NSURL URLWithString:expert.fileurl]];
        cell.introLabel.text = expert.intro;
        return cell;

    }else{
        static NSString * identifier = @"comment";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDExpertCommentCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDExpertCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        KDExpertComment * comment = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.comment = comment;
        return cell;

    }

}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }else if (indexPath.section == 1){
        return 200;;
    }else{
        return 150;
    }
}
//区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

//区尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
//点击cell时的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        KDTopicDetailViewController * topicVC = [[KDTopicDetailViewController alloc] init];
        KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        topicVC.topicTitle = topic.title;
        topicVC.grade = topicVC.grade;
        [self.navigationController pushViewController:topicVC animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray * array = @[@"话题",@"专家介绍",@"评论"];
    UIView * commentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 30)];
    UIButton * moreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    moreButton.frame = CGRectMake(Width-20, 5, 20, 20);
    moreButton.tag = 100+section;
    [moreButton addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [moreButton setBackgroundImage:[UIImage imageNamed:@"iconfont-iconfontleft.png"] forState:UIControlStateNormal];
    [commentView addSubview:moreButton];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 30)];
    label.text = array[section];
    [commentView addSubview:label];
    if (section == 0) {
        [moreButton setBackgroundImage:nil forState:UIControlStateNormal];
        return commentView;
    }else{
        return commentView;
    }
    
}
//区头上箭头的点击事件
- (void)didClickButton:(UIButton *)button
{
    if (button.tag == 101) {
        NSLog(@"点击了专家介绍");
        KDExpertIntroViewController * introVC = [[KDExpertIntroViewController alloc] init];
        introVC.infoDic = self.dic;
        [self.navigationController pushViewController:introVC animated:YES];
        
    }else if (button.tag == 102){
        KDExpertCommentTableViewController * commentTVC = [[KDExpertCommentTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:commentTVC animated:YES];
    }
    
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
