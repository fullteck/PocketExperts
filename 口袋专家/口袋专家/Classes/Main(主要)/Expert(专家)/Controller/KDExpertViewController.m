//
//  ExpertViewController.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/4.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertViewController.h"
#import "AFNetworking.h"
#import "KDExpertList.h"
#import "KDExpertListCell.h"
#import "KDExpertDetailViewController.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height
#define kNetRequestUrl @"http://192.168.2.36:5000/api/v1.0/expert/list/23.4324324/32.3213213"
@interface KDExpertViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray * expertArray;
@property(nonatomic,strong)UITableView * listTableView;

@end


@implementation KDExpertViewController

- (NSMutableArray *)expertArray
{
    if (_expertArray == nil) {
        _expertArray = [NSMutableArray array];
    }
    return _expertArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"专家";
    [self initWithTableView];
    [self getDataFromNetwork];
}

//创建tableView
- (void)initWithTableView
{
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height) style:UITableViewStylePlain];
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    [self.view addSubview:_listTableView];
}

//获取专家
- (void)getDataFromNetwork
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kNetRequestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = (NSDictionary *)responseObject;
        NSArray * expertListArray = [dic objectForKey:@"list"];
        for (NSDictionary * expertDic in expertListArray) {
//            NSLog(@"%@",expertDic[@"meet_c"]);
            KDExpertList * expert = [[KDExpertList alloc] init];
            [expert setValuesForKeysWithDictionary:expertDic];
            [self.expertArray addObject:expert];
        }
        [self.listTableView reloadData];
        NSLog(@"===%ld",self.expertArray.count);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark---tableView协议中的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.expertArray.count;
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
    KDExpertList * expert = [self.expertArray objectAtIndex:indexPath.row];
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
    KDExpertList * expert = [self.expertArray objectAtIndex:indexPath.row];
    expertDetailVC.urlId = expert._id;
    [self.navigationController pushViewController:expertDetailVC animated:YES];
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
