//
//  KDTopicDetailViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDTopicDetailViewController.h"

#import "AFNetworking.h"

#import "KDConst.h"


@interface KDTopicDetailViewController ()
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView * gradeImage;
@property(nonatomic,strong)UITextView * content;
@end

@implementation KDTopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"话题详情";
    [self initWithSubviews];
    [self getNetWorkRequest];
}

- (void)initWithSubviews
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 64+40, Width-40, 60)];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.backgroundColor = [UIColor redColor];
    _titleLabel.text = _topicTitle;
    [self.view addSubview:_titleLabel];
    self.gradeImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 64+110, 120, 20)];
    _gradeImage.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_gradeImage];
    self.content = [[UITextView alloc] initWithFrame:CGRectMake(20, 64+160, Width-40, Height-160-64)];
    _content.editable = NO;
    _content.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_content];
    
}

- (void)getNetWorkRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kNetUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dic = responseObject[@"topic"];
        self.content.text = dic[@"con"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
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
