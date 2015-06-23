//
//  KDLeftHeadTableViewCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDLeftHeadTableViewCell.h"

@implementation KDLeftHeadTableViewCell

+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDLeftHeadTableViewCell" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
