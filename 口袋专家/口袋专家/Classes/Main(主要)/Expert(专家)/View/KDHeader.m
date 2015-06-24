//
//  KDHeader.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDHeader.h"

@implementation KDHeader
+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDHeader" owner:nil options:nil] firstObject];
}

- (void)setExpert:(KDExpertList *)expert
{
    self.nameLabel.text = expert.name;
    self.jobLabel.text = expert.job;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
