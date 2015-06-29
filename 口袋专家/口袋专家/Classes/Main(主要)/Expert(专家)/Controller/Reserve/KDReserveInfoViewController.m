//
//  KDReserveInfoViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/29.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReserveInfoViewController.h"
#import "KDReservePayController.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

@interface KDReserveInfoViewController ()

@end

@implementation KDReserveInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * rightBI = [[UIBarButtonItem alloc] initWithTitle:@"支付" style:UIBarButtonItemStyleDone target:self action:@selector(didClickPay:)];
    self.navigationItem.rightBarButtonItem = rightBI;
    [self createSubviews];
}

- (void)didClickPay:(UIBarButtonItem *)BI
{
    KDReservePayController * payVC = [[KDReservePayController alloc] init];
    [self.navigationController pushViewController:payVC animated:YES];
}

- (void)createSubviews
{
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 64+10, Width-40, 40)];
    label1.text = @"我的预约单";
    [self.view addSubview:label1];
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 64+70, 40, 40)];
    label2.text = @"专家:";
    [self.view addSubview:label2];
    self.expertName = [[UILabel alloc] initWithFrame:CGRectMake(65, 64+70, 100, 40)];
    _expertName.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_expertName];
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 64+130, 40, 40)];
    label3.text = @"话题:";
    [self.view addSubview:label3];
    self.topicIntro = [[UILabel alloc] initWithFrame:CGRectMake(65, 64+130, Width-75, 40)];
    _topicIntro.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_topicIntro];
    UILabel * label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 64+190, 40, 40)];
    label4.text = @"时间:";
    [self.view addSubview:label4];
    self.resrerveTime = [[UILabel alloc] initWithFrame:CGRectMake(65, 64+190, 40, 40)];
    _resrerveTime.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_resrerveTime];
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width/2+40, 64+310, Width/2-80, 60)];
    _priceLabel.font = [UIFont systemFontOfSize:30];
    _priceLabel.text = @"$100";
    [self.view addSubview:_priceLabel];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20,64+370, 100, 40);
    [button setTitle:@"我约的专家" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor cyanColor];
    [button addTarget:self action:@selector(didClickEnterMyExpert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
}

- (void)didClickEnterMyExpert:(UIButton *)button
{
    
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
