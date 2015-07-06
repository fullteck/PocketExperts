//
//  KDMyReserveCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/2.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDMyReserveCell.h"
#import "UIImageView+WebCache.h"
@implementation KDMyReserveCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setReserve:(KDMyReserve *)reserve
{
    NSDictionary * dic = reserve.info;
    self.nameLabel.text = dic[@"name"];
    self.jobLabel.text = dic[@"job"];
    self.topicLabel.text = reserve.topic_title;
    self.priceLabel.text = [NSString stringWithFormat:@"%ld",reserve.price];
    [self.headPic sd_setImageWithURL:[NSURL URLWithString:dic[@"avaurl"]]];
    if (reserve.state == 0) {
        [self.stateBtn setTitle:@"已取消" forState:UIControlStateNormal];
        [self.radioBtn setHidden:YES];
    }else if (reserve.state == 1){
        [self.stateBtn setTitle:@"进行中" forState:UIControlStateNormal];
        if (reserve.paystate == 0) {
            [self.radioBtn setTitle:@"未支付" forState:UIControlStateNormal];
        }else{
            [self.radioBtn setTitle:@"已支付" forState:UIControlStateNormal];
        }
    }else{
        [self.stateBtn setTitle:@"已结束" forState:UIControlStateNormal];
        [self.radioBtn setTitle:@"已录音" forState:UIControlStateNormal];
    }
    
}

@end
