//
//  KDExpertCommentCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertCommentCell.h"

@implementation KDExpertCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setComment:(KDExpertComment *)comment
{
    self.nameLabel.text = comment.name;
    self.dataLabel.text = [NSString stringWithFormat:@"%ld",comment.data];
    self.top_titleLabel.text = comment.top_title;
    self.conLabel.text = comment.con;
}

@end
