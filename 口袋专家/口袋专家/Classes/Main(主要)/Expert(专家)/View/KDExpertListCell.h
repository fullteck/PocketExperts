//
//  KDExpertListCell.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertList.h"
@interface KDExpertListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UIImageView *sexpic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gradepic;
@property (weak, nonatomic) IBOutlet UILabel *meet_cLabel;
@property(nonatomic,strong)KDExpertList * expert;

@end
