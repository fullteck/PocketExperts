//
//  KDExpertTeamTableViewCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTeamTableViewCell.h"
#import "KDProfessorView.h"
#import "KDConst.h"

@interface KDExpertTeamTableViewCell()
@property(nonatomic,weak) IBOutlet KDProfessorView * professor1;
@property(nonatomic,weak) IBOutlet KDProfessorView * professor2;
@property(nonatomic,weak) IBOutlet KDProfessorView * professor3;
@property(nonatomic,weak) IBOutlet KDProfessorView * professor4;
@property(nonatomic,weak) IBOutlet KDProfessorView * professor5;
@end
@implementation KDExpertTeamTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"teamcell";
    KDExpertTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [KDExpertTeamTableViewCell expertTeam];
    }
    return cell;
}

+ (instancetype)expertTeam
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertTeamTableViewCell" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
