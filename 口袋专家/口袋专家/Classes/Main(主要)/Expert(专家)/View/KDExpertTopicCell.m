//
//  KDExpertTopicCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTopicCell.h"
#import "KDHandle.h"
@interface KDExpertTopicCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *numberOfStar;
@property (weak, nonatomic) IBOutlet UILabel *numberOfComment;
@property (weak, nonatomic) IBOutlet UIView *priceBorder;

@property (weak, nonatomic) IBOutlet UILabel *price;
@end

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
    self.title.text = topic.title;
    self.content.text = topic.intro;
    self.priceBorder.layer.borderWidth = 0.5;
    self.priceBorder.layer.borderColor = [[UIColor colorWithRed:255/255.0 green:90/255.0 blue:95/255.0 alpha:1.0] CGColor];
    self.priceBorder.layer.cornerRadius = 2;
    self.price.text = [NSString stringWithFormat:@"%ld",topic.pri];
     [KDHandle shareInstance].cellHeight =CGRectGetMaxY(self.numberOfStar.frame)+32;
}



@end
