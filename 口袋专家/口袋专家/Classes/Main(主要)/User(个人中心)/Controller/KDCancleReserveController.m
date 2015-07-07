//
//  KDCancleReserveController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/7.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDCancleReserveController.h"
#import "KDConst.h"
@interface KDCancleReserveController ()
@property(nonatomic,strong)UITextView * textView;
@end

@implementation KDCancleReserveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubviews];
}

- (void)createSubviews
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20+64, 300, 40)];
    label.text = @"请输入您取消的原因:";
    [self.view addSubview:label];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 70+64, Width-40, 200)];
    _textView.layer.cornerRadius = 2;
    _textView.layer.borderWidth = 1;
    [self.view addSubview:_textView];
    UIBarButtonItem * BI = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(didClickEnsure:)];
    self.navigationItem.rightBarButtonItem = BI;
}

- (void)didClickEnsure:(UIBarButtonItem *)BI
{
    NSLog(@"%@",_textView.text);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
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
