//
//  KDPayView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDPayView.h"

@implementation KDPayView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    }
    return self;
}

+ (instancetype)pay
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDPayView" owner:nil options:nil] firstObject];
}

//+ (instancetype)instance
//{
//    return [[[NSBundle mainBundle] loadNibNamed:@"KDPayView" owner:nil options:nil] firstObject];
//}


@end
