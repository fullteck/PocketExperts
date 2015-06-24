//
//  KDExpertListCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertListCell.h"

@implementation KDExpertListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setExpert:(KDExpertList *)expert
{
    self.nameLabel.text = expert.name;
    self.jobLabel.text = expert.job;
    self.meet_cLabel.text = [NSString stringWithFormat:@"%ld",expert.meet_c];
}

@end
