//
//  KDExpertIntroHeader.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertIntroHeader.h"

@implementation KDExpertIntroHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertIntroHeader" owner:nil options:nil] firstObject];
}

- (CGFloat)getHeight
{
    return CGRectGetMaxY(self.introduce.frame) + 16;
}

@end
