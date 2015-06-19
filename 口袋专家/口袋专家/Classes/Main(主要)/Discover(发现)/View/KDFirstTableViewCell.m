//
//  FirstTableViewCell.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDFirstTableViewCell.h"

@implementation KDFirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.expert1 = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(70, 75, 60, 70)];
    [self.contentView addSubview:_expert1];
    self.expert2 = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(135, 75, 60, 70)];
    [self.contentView addSubview:_expert2];
    self.expert3 = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(200, 75, 60, 70)];
    [self.contentView addSubview:_expert3];
    self.expert4 = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(265, 75, 60, 70)];
    [self.contentView addSubview:_expert4];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self createSubviews];
//    }
//    return self;
//}
//
//- (void)createSubviews
//{
//    self.expert1 = [[ExpertPicAndName alloc] initWithFrame:CGRectMake(80, 75, 60, 70)];
//    _expert1.backgroundColor = [UIColor redColor];
//    [self.contentView addSubview:_expert1];
//    self.expert2 = [[ExpertPicAndName alloc] initWithFrame:CGRectMake(145, 75, 60, 70)];
//    [self.contentView addSubview:_expert2];
//    self.expert3 = [[ExpertPicAndName alloc] initWithFrame:CGRectMake(210, 75, 60, 70)];
//    [self.contentView addSubview:_expert2];
//    self.expert4 = [[ExpertPicAndName alloc] initWithFrame:CGRectMake(275, 75, 60, 70)];
//    [self.contentView addSubview:_expert2];
//    
//}

@end
