//
//  KDExpertTDetailTableViewCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTDetailTableViewCell.h"

@interface KDExpertTDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
@implementation KDExpertTDetailTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"detailcell";
    KDExpertTDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [KDExpertTDetailTableViewCell expertDetail];
    }
    return cell;
}

+ (instancetype)expertDetail
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertTDetailTableViewCell" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
