//
//  KDReserveController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReserveController.h"
#import "KDReserveTimeViewController.h"
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height
@interface KDReserveController ()
@property(nonatomic,strong)UISegmentedControl * reserveSegment;
@property(nonatomic,strong)UILabel * priceLabel;
@property(nonatomic,strong)NSMutableDictionary * inforDic;
@property(nonatomic,assign)BOOL kindIsSet;
@property(nonatomic,assign)BOOL topicIsSet;
@end

@implementation KDReserveController
//传入下个界面的字典
- (NSMutableDictionary *)inforDic
{
    if (_inforDic == nil) {
        _inforDic = [NSMutableDictionary dictionary];
    }
    return _inforDic;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * BI = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(dicClickNext:)];
    self.navigationItem.rightBarButtonItem = BI;
    [self createSubviews];
    self.kindIsSet = YES;
    [self.inforDic setObject:@"0" forKey:@"kind"];
    [self.inforDic setObject:@"free" forKey:@"price"];
    
}

- (void)dicClickNext:(UIBarButtonItem *)BI
{
    NSLog(@"===");
    if (self.topicIsSet == NO) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请选择您要预约的话题" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
    }else{
        KDReserveTimeViewController * timeVC = [[KDReserveTimeViewController alloc] init];
        timeVC.infroDic = self.inforDic;
        timeVC.block = ^(void){
            [self.navigationController popViewControllerAnimated:NO];
        };
        [self.navigationController pushViewController:timeVC animated:YES];
    }
    
}

#pragma mark---创建segment
- (void)createSubviews
{
    NSArray * kindArray = @[@"在线聊",@"通通话",@"见个面"];
    
    self.reserveSegment = [[UISegmentedControl alloc] initWithItems:kindArray];
    _reserveSegment.frame = CGRectMake(0, 20+64, Width, 40);
    _reserveSegment.selectedSegmentIndex = 0;
    [_reserveSegment addTarget:self action:@selector(didClickChangeCommunication:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_reserveSegment];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 80+64, 100, 40)];
    label.text = @"预约话题";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width-250, 80+64, 220, 40)];
    _priceLabel.text = @"免费";
    _priceLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:_priceLabel];
    for (int i = 0; i < 3; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(20, 120+64+i*80, Width-40, 60);
        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(didClickTopicButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

}
//button的点击事件
- (void)didClickTopicButton:(UIButton *)button
{
    NSLog(@"%@",button.titleLabel.text);
    self.topicIsSet = YES;
    [self.inforDic setObject:button.titleLabel.text forKey:@"topic"];
}
//segment的点击事件
- (void)didClickChangeCommunication:(UISegmentedControl *)segment
{
    NSInteger number = segment.selectedSegmentIndex;
    switch (number) {
        case 0:
            NSLog(@"0");
            _priceLabel.text = @"免费";
            break;
        case 1:
            NSLog(@"1");
            _priceLabel.text = @"100元/1小时左右";
            [self.inforDic setObject:@"1" forKey:@"kind"];
            [self.inforDic setObject:@"100元/1小时左右" forKey:@"price"];
            break;
        case 2:
            NSLog(@"2");
            _priceLabel.text = @"500元/次(1小时左右)";
            [self.inforDic setObject:@"2" forKey:@"kind"];
            [self.inforDic setObject:@"500元/次（1小时左右）" forKey:@"price"];

            break;
            
        default:
            break;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.topicIsSet = NO;
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
