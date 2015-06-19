//
//  KDExpertTopicCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTopicCell.h"

@implementation KDExpertTopicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTopic:(KDExpertTopic *)topic
{
    self.titleLabel.text = topic.title;
    NSLog(@"11%@",topic.title);
    self.introLabel.text = topic.intro;
    self.priLabel.text = [NSString stringWithFormat:@"%ld",topic.pri];
}

@end
