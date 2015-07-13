//
//  KDExpertTopicDetailViewController.m
//  口袋专家
//
//  Created by 赵永杰 on 15/7/13.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTopicDetailViewController.h"
#import "AFNetworking.h"
#import "KDConst.h"

@interface KDExpertTopicDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topicTitle;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStar;

@property (weak, nonatomic) IBOutlet UILabel *numberOfComment;
@property (weak, nonatomic) IBOutlet UILabel *content;
@end

@implementation KDExpertTopicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"话题";
    UIBarButtonItem * BI = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(didClickBack:)];
    self.navigationItem.leftBarButtonItem = BI;
    self.topicTitle.text = _topic;
    self.job.text = _expert.job;
    [self getNetWorkRequest];
}

- (void)didClickBack:(UIBarButtonItem *)BI
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)getNetWorkRequest
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kTopicDetail parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
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
