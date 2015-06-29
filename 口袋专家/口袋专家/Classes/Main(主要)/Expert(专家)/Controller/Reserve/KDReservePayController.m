//
//  KDReservePayController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/29.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReservePayController.h"
#import "UIPopoverListView.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

@interface KDReservePayController ()<UIPopoverListViewDelegate,UIPopoverListViewDataSource>

@end

@implementation KDReservePayController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubviews];
}

- (void)createSubviews
{
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, 10+64, 100, 60)];
    label1.text = @"需要支付";
    [self.view addSubview:label1];
    UILabel * priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 70+64, Width-80, 120)];//价格
    priceLabel.text = @"$100";
    priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:priceLabel];
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 190+64, 100, 40)];
    label2.text = @"余额支付";
    [self.view addSubview:label2];
    self.useMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width-120, 190+64, 100, 40)];//可用余额
    _useMoneyLabel.text = @"0元可用";
    [self.view addSubview:_useMoneyLabel];
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(0, 190+64, Width, 40);
    [button1 addTarget:self action:@selector(didClickPayWithMoney:) forControlEvents:UIControlEventTouchUpInside];//余额支付button
    [self.view addSubview:button1];
    UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, 230+64, 100, 40)];
    label3.text = @"其他支付";
    [self.view addSubview:label3];
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];//其他支付button
    button2.frame = CGRectMake(0, 230+64, Width, 40);
    [button2 addTarget:self action:@selector(didClickPayWithOther:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];//立即充值button
    button3.frame = CGRectMake(40, 370+64, Width-80, 40);
    [button3 setTitle:@"立即充值" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor cyanColor];
    [button3 addTarget:self action:@selector(didClickRecharge:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}
//余额支付
- (void)didClickPayWithMoney:(UIButton *)button
{
    NSLog(@"余额支付");
}
//其他支付
- (void)didClickPayWithOther:(UIButton *)button
{
    NSLog(@"其他支付");
    CGFloat xWidth = self.view.bounds.size.width - 20.0f;
    CGFloat yHeight = 152.0f;
    CGFloat yOffset = (self.view.bounds.size.height - yHeight)/2.0f;
    UIPopoverListView *poplistview = [[UIPopoverListView alloc] initWithFrame:CGRectMake(10, yOffset, xWidth, yHeight)];
    poplistview.delegate = self;
    poplistview.datasource = self;
    poplistview.listView.scrollEnabled = FALSE;
    [poplistview setTitle:@"支付方式"];
    [poplistview show];

}
//立即充值
- (void)didClickRecharge:(UIButton *)button
{
    NSLog(@"立即充值");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIPopoverListViewDataSource

- (UITableViewCell *)popoverListView:(UIPopoverListView *)popoverListView cellForIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    NSInteger row = indexPath.row;
    if(row == 0){
        cell.textLabel.text = @"微信支付";
        cell.imageView.image = [UIImage imageNamed:@"20150408041714954_easyicon_net_48.png"];
    }else if (row == 1){
        cell.textLabel.text = @"支付宝支付";
        cell.imageView.image = [UIImage imageNamed:@"20150408041404494_easyicon_net_48.png"];
    }    return cell;
}

- (NSInteger)popoverListView:(UIPopoverListView *)popoverListView
       numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

#pragma mark - UIPopoverListViewDelegate
- (void)popoverListView:(UIPopoverListView *)popoverListView
     didSelectIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",indexPath.row);
}

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
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
