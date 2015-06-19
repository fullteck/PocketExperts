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
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

@interface KDExpertDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * detailTableView;
@property(nonatomic,strong)NSMutableArray * resultArray;


@end



@implementation KDExpertDetailViewController

- (NSMutableArray *)resultArray
{
    if (_resultArray == nil) {
        _resultArray = [NSMutableArray array];
    }
    return _resultArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getNetworkWithUrl];
}
//
- (void)initWithTableView
{
    self.detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStyleGrouped];
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    [self.view addSubview:_detailTableView];
}
- (void)getNetworkWithUrl
{
    NSString * headStr = @"http://192.168.2.36:5000";
    NSString * footStr = [NSString stringWithFormat:@"/api/v1.0/expert/info/%ld",_urlId];
    NSString * str = [headStr stringByAppendingString:footStr];
    NSLog(@"%@",str);
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary * dic = responseObject[@"expert"];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"话题";
            break;
        case 1:
            return @"专家介绍";
            break;
        case 2:
            return @"评论";
            break;
            
        default:
            break;
    }
    return nil;
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
