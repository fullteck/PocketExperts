//
//  KDExpertTopicCell.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertTopic.h"
@interface KDExpertTopicCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *priLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gradepic;
@property(nonatomic,strong)KDExpertTopic * topic;

@end
