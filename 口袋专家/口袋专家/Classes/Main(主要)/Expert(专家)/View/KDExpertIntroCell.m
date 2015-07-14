//
//  KDExpertIntroCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertIntroCell.h"
#import "KDHandle.h"

@interface KDExpertIntroCell ()


@property (weak, nonatomic) IBOutlet UIImageView *detail;


@end


@implementation KDExpertIntroCell

- (void)awakeFromNib {
    // Initialization code
    [KDHandle shareInstance].cellHeight = CGRectGetMaxY(self.detail.frame) + 16;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
