//
//  KDExpertDetailHeaderView.m
//  口袋专家
//
//  Created by 赵永杰 on 15/7/12.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertDetailHeaderView.h"

@implementation KDExpertDetailHeaderView

+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertDetailHeaderView" owner:self options:nil] lastObject];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
