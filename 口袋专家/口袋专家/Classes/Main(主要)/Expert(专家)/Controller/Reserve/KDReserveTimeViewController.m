//
//  KDReserveTimeViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReserveTimeViewController.h"
#import "KDExpertDetailViewController.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

@interface KDReserveTimeViewController ()
{
    NSString * type;
    NSString * title;
}
@end

@implementation KDReserveTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    type = [_infroDic objectForKey:@"kind"];
    [self ensureButtonTitle];
    [self createBarButtonItems];
    [self createSubviews];
}
            
- (void)ensureButtonTitle
{
}
//创建barButtonItem
- (void)createBarButtonItems
{
    UIBarButtonItem * leftBI = [[UIBarButtonItem alloc] initWithTitle:@"上一步" style:UIBarButtonItemStyleDone target:self action:@selector(didClickCancle:)];
    self.navigationItem.leftBarButtonItem = leftBI;
    if ([type isEqualToString:@"0"]) {
        UIBarButtonItem * rightBI = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(didClickRightBI:)];
        self.navigationItem.rightBarButtonItem = rightBI;
    }else{
        UIBarButtonItem * rightBI = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(didClickCommit:)];
        self.navigationItem.rightBarButtonItem = rightBI;
    }
}

#pragma mark---UIBarButtonItem触发的事件
- (void)didClickCancle:(UIBarButtonItem *)BI
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didClickRightBI:(UIBarButtonItem *)BI
{
    [self.navigationController popViewControllerAnimated:NO];
    _block();
}

- (void)didClickCommit:(UIBarButtonItem *)BI
{
    NSLog(@"点击了提交");
}

#pragma mark---创建subViews

- (void)createSubviews
{
    if ([type isEqualToString:@"0"]) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 100, 100, 100);
        button.backgroundColor = [UIColor blackColor];
        [button addTarget:self action:@selector(didClickChatWithExpert:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }else
    {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 40+64, Width-40, 60)];
        label.text = @"预约时间";
        label.backgroundColor = [UIColor redColor];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:label];
        UIButton * immediateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        immediateButton.frame = CGRectMake(20, 110+64, Width-40, 60);
        immediateButton.backgroundColor = [UIColor cyanColor];
        if ([type isEqualToString:@"1"]) {
            [immediateButton setTitle:@"立即通话" forState:UIControlStateNormal];
        }else{
            [immediateButton setTitle:@"立即见面" forState:UIControlStateNormal];
        }
        [immediateButton addTarget:self action:@selector(didClickImmediateMeet:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:immediateButton];
    }
    UIButton * timePickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    timePickButton.frame = CGRectMake(20, 180+64, Width-40, 60);
    timePickButton.backgroundColor = [UIColor cyanColor];
    [timePickButton setTitle:@"选择时间" forState:UIControlStateNormal];
    [timePickButton addTarget:self action:@selector(didClickPickTime:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:timePickButton];
}


//免费聊天的button按钮的触发事件
- (void)didClickChatWithExpert:(UIButton *)button
{
    NSLog(@"开始聊天啦");
}
//立即见面按钮
- (void)didClickImmediateMeet:(UIButton *)button
{
    NSLog(@"点击了立即见面");
}
//选择时间按钮
- (void)didClickPickTime:(UIButton *)button
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
