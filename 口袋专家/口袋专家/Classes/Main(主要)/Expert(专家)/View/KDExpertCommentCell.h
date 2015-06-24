//
//  KDExpertCommentCell.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertComment.h"
@interface KDExpertCommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gradepic;
@property (weak, nonatomic) IBOutlet UILabel *top_titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *conLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property(nonatomic,strong)KDExpertComment * comment;
@end
