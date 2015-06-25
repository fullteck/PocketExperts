//
//  KDExpertHeaderView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertHeaderView.h"

@implementation KDExpertHeaderView
+ (instancetype)expertHeader
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertHeaderView" owner:nil options:nil] lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
