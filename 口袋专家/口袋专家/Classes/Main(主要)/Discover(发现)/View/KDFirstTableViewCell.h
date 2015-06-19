//
//  FirstTableViewCell.h
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertPicAndName.h"
@interface KDFirstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *topicName;
@property (weak, nonatomic) IBOutlet UILabel *topicIntroduce;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *expertNumber;
@property(nonatomic,strong)KDExpertPicAndName * expert1;
@property(nonatomic,strong)KDExpertPicAndName * expert2;
@property(nonatomic,strong)KDExpertPicAndName * expert3;
@property(nonatomic,strong)KDExpertPicAndName * expert4;

@end
