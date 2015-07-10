//
//  KDChatNumberView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/10.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDChatNumberView.h"

@implementation KDChatNumberView

+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDChatNumberView" owner:nil options:nil] firstObject];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"KDChatNumberView" owner:nil options:nil] firstObject];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
