//
//  KDReserveInfroView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReserveInfroView.h"
#define Width self.frame.size.width
#define Height self.frame.size.height
#define kHeight self.frame.size.height/2
@implementation KDReserveInfroView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
//    self.alpha = 0.8;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(60, Height/4, Width-120, Height/2)];
    view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1.0];
//    view.alpha = 0.5;
    [self addSubview:view];
    self.beforeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _beforeButton.frame = CGRectMake(10, 0, 60,kHeight/8);
    [_beforeButton setTitle:@"上一步" forState:UIControlStateNormal];
    [view addSubview:_beforeButton];
    self.PayButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _PayButton.frame = CGRectMake(Width-60-120,0, 60, kHeight/8);
    [_PayButton setTitle:@"支付" forState:UIControlStateNormal];
    [view addSubview:_PayButton];
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kHeight/8, Width-40, kHeight/8)];
    titleLabel.text = @"我的预约单";
    [view addSubview:titleLabel];
    UILabel * expert = [[UILabel alloc] initWithFrame:CGRectMake(20, kHeight/4, 60, kHeight/8)];
    expert.text = @"专家:";
    [view addSubview:expert];
    self.expertNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, kHeight/4, 100, kHeight/8)];
    _expertNameLabel.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_expertNameLabel];
    UILabel * topic = [[UILabel alloc] initWithFrame:CGRectMake(20, kHeight/8*3, 60, kHeight/8)];
    topic.text = @"话题:";
    [view addSubview:topic];
    self.topicNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, kHeight/8*3, Width-80, kHeight/8)];
    [view addSubview:_topicNameLabel];
    UILabel * time = [[UILabel alloc] initWithFrame:CGRectMake(20, kHeight/2, 60, kHeight/8)];
    time.text = @"时间:";
    [view addSubview:time];
    self.reserveTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, kHeight/2, Width-80, kHeight/8)];
    _reserveTimeLabel.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_reserveTimeLabel];
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kHeight/8*5, Width/2-40, kHeight/4)];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel.text = @"$100";
    [view addSubview:_priceLabel];
    self.myExpertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _myExpertButton.frame = CGRectMake(20, kHeight/8*7, 100, kHeight/8);
    _myExpertButton.backgroundColor = [UIColor redColor];
    [_myExpertButton setTitle:@"+我的专家" forState:UIControlStateNormal];
    [view addSubview:_myExpertButton];
    
}

@end
