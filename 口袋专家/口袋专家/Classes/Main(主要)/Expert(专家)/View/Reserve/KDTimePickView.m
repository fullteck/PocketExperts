//
//  KDTimePickView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/2.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDTimePickView.h"
#import "KDConst.h"
@implementation KDTimePickView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//    self.alpha = 0.5;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, ViewH, ViewW, 260)];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    [UIView animateWithDuration:1.0f animations:^{
        view.frame = CGRectMake(0, ViewH-260, ViewW, 260);
    } completion:^(BOOL finished) {
        self.cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.frame = CGRectMake(60, ViewH-50, 120, 40);
        _cancleBtn.backgroundColor = [UIColor grayColor];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancleBtn];
        
        self.ensureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _ensureBtn.frame = CGRectMake(ViewW-180, ViewH-50, 120, 40);
        [_ensureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _ensureBtn.backgroundColor = [UIColor grayColor];
        [self addSubview:_ensureBtn];

    }];
    //创建时间选择器
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, ViewW, 200)];
    [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [_datePicker setTimeZone:[NSTimeZone defaultTimeZone]];
    [_datePicker setMinimumDate:[NSDate date]];
    [view addSubview:_datePicker];
 }

@end
