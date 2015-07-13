//
//  KDExpertDetailViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertDetailViewController.h"

#import "AFNetworking.h"

#import "KDExpertTopicCell.h"

#import "KDExpertIntroCell.h"

#import "KDExpertCommentCell.h"

#import "KDExpertList.h"

#import "KDExpertComment.h"

#import "KDExpertTopic.h"

#import "UIImageView+WebCache.h"

#import "KDHeader.h"


#import "KDExpertCommentTableViewController.h"

#import "KDExpertIntroViewController.h"

#import "KDReserveController.h"

#import "KDConst.h"

#import "KDExpertDetailHeaderView.h"

#import "KDHandle.h"

#import "KDExpertTopicDetailViewController.h"


@interface KDExpertDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * detailTableView;//tableView
@property(nonatomic,strong)NSMutableArray * resultArray;//存放数据
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
    self.view.backgroundColor = [UIColor whiteColor];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.alpha = 1;
//    self.navigationController.navigationBar.tintColor = nil;
    self.navigationController.navigationBar.translucent = NO;
    [self createBarButtonItem];
    [self initWithTableView];
    [self getNetworkWithUrl];
}

- (void)createBarButtonItem
{
    UIBarButtonItem * leftBI = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickBack:)];
    self.navigationItem.leftBarButtonItem = leftBI;
    UIBarButtonItem * likeBI = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"like"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickLike:)];
    UIBarButtonItem * shareBI = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"share"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickShare:)];
    NSArray * rightArr = @[shareBI,likeBI];
    self.navigationItem.rightBarButtonItems =  rightArr;
}

#pragma mark - UIBarButtonItem对应的触发事件

- (void)didClickBack:(UIBarButtonItem *)BI
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didClickLike:(UIBarButtonItem *)BI
{
    NSLog(@"点击了赞");
}

- (void)didClickShare:(UIBarButtonItem *)BI
{
    NSLog(@"点击了分享");
}

//点击预约按钮
- (void)didCickReserve:(UIButton *)button
{
    NSLog(@"点击了预约");
    KDReserveController * reserveVC = [[KDReserveController alloc] init];
    [self.navigationController pushViewController:reserveVC animated:YES];
}

#pragma mark - initTableView
- (void)initWithTableView
{
    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height-44) style:UITableViewStyleGrouped];
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    [self.view addSubview:_detailTableView];
    self.detailTableView.tableHeaderView = [KDHeader instance];
    UIButton * reserveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reserveBtn.frame = CGRectMake(0,Height-44-64, Width, 44);
    [reserveBtn setTitle:@"预约" forState:UIControlStateNormal];
    [reserveBtn setBackgroundColor:[UIColor colorWithRed:93/255.0 green:163/255.0 blue:255/255.0 alpha:1.0]];
    [self.view addSubview:reserveBtn];
    [reserveBtn addTarget:self action:@selector(didCickReserve:) forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark - NetWork
- (void)getNetworkWithUrl
{
    NSString * headStr = @"http://182.254.221.13:8080";
    NSString * footStr = [NSString stringWithFormat:@"/api/v1.0/expert/info/%d",11];
    NSString * str = [headStr stringByAppendingString:footStr];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //把解析出得数据加到字典里
        NSArray * one = @[@"1"];
        [self.resultArray addObject:one];
        NSArray * two = @[@"2"];
        [self.resultArray addObject:two];
        NSDictionary * dic = responseObject[@"expert"];
        self.dic = dic[@"info"];
        NSArray * topicArray = dic[@"topic"];
        NSMutableArray * topicArr = [NSMutableArray array];
        for (NSDictionary * dic1 in topicArray) {
            KDExpertTopic * topic = [[KDExpertTopic alloc] init];
            [topic setValuesForKeysWithDictionary:dic1];
            [topicArr addObject:topic];
        }
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
        [self.detailTableView reloadData];
        KDHeader * header = (KDHeader *)self.detailTableView.tableHeaderView;
        header.expert = [[self.resultArray objectAtIndex:1] objectAtIndex:0];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}
#pragma mark - tableView协议中的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.resultArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[self.resultArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"biaoqian"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"biaoqian"];
        }
        cell.textLabel.text = @"biaoqian";
        return cell;
    }else if (indexPath.section == 1){
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"lingyu"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lingyu"];
        }
        cell.textLabel.text = @"lingyu";
        return cell;

    }
    
    if (indexPath.section == 2) {
        KDExpertTopicCell * cell = (KDExpertTopicCell *)[tableView dequeueReusableCellWithIdentifier:@"expertList"];
        if (cell == nil) {
            NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertTopicCell" owner:self options:nil];
            cell = [arr lastObject];
        }
        KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.topic = topic;
        return cell;
    }else if (indexPath.section == 3){
        KDExpertIntroCell * cell = (KDExpertIntroCell *)[tableView dequeueReusableCellWithIdentifier:@"expertIntro"];
        if (cell == nil) {
            NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertIntroCell" owner:self options:nil];
            cell = [arr lastObject];
        }

    KDExpertList * expert = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]
        ;
        [cell.headpic sd_setImageWithURL:[NSURL URLWithString:expert.fileurl]];
        cell.intro.text = expert.intro;
        return cell;

    }else{
        KDExpertCommentCell * cell = (KDExpertCommentCell *)[tableView dequeueReusableCellWithIdentifier:@"expertComment"];
        if (cell == nil) {
            NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDExpertCommentCell" owner:self options:nil];
            cell = [arr lastObject];
        }
        KDExpertComment * comment = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.comment = comment;
        return cell;
    }

}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return [KDHandle shareInstance].cellHeight;
    }else if (indexPath.section == 3){
        return [KDHandle shareInstance].cellHeight;;
    }else if (indexPath.section == 4){
        return [KDHandle shareInstance].cellHeight;
    }else{
        return 40;
    }
}
//区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

//区尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
//点击cell时的事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        KDExpertTopicDetailViewController * topicVC = [[KDExpertTopicDetailViewController alloc] initWithNibName:@"KDExpertTopicDetailViewController" bundle:nil];
        KDExpertTopic * topic = [[self.resultArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        KDExpertList * expert = [[self.resultArray objectAtIndex:3] objectAtIndex:0];
        
        topicVC.topic = topic.title;
        topicVC.expert = expert;
        [self.navigationController pushViewController:topicVC animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray * array = @[@"label column",@"coverage area column",@"topic column",@"introduction column",@"comments column"];
    KDExpertDetailHeaderView * view = [KDExpertDetailHeaderView instance];
    view.picImage.image = [UIImage imageNamed:[array objectAtIndex:section]];
    return view;
    
    
}
//区头上箭头的点击事件
- (void)didClickButton:(UIButton *)button
{
    if (button.tag == 101) {
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
