//
//  ListingCell.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingCell.h"
#define Width [[UIScreen mainScreen] bounds].size.width

@implementation KDListingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
        
    }
    return self;
}

- (void)createSubviews
{
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 20, 20)];
    _numberLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_numberLabel];
    self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, Width-60, 350)];
    _backImage.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_backImage];
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Width - 80, 200)];
    _contentLabel.text = @"北京（Beijing;Peking），中华人民共和国的首都、直辖市、国家中心城市，是中国的政治、文化中心，全国重要的交通枢纽和最大空港，国家经济的决策和管理中心，是中华人民共和国中央人民政府和全国人民代表大会的办公所在地。\n北京位于华北平原北部，背靠燕山，毗邻天津市和河北省。北京市下辖东城区、西城区、朝阳区、海淀区、丰台区、石景山区、门头沟区、房山区、大兴区、通州区、顺义区、昌平区、平谷区、怀柔区、密云县、延庆县等16个区县。2014年末，北京市常住人口2151.6万人。\n北京是中国“八大古都”之一，拥有7项世界遗产，是世界上拥有世界文化遗产数最多的城市，是一座有着三千余年建城史、八百六十余年建都史的历史文化名城，拥有众多名胜古迹和人文景观。";
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:16];
    [_backImage addSubview:_contentLabel];
    UILabel * recommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 215, 60, 30)];
    recommendLabel.text = @"推荐专家";
    recommendLabel.font = [UIFont systemFontOfSize:14];
    [_backImage addSubview:recommendLabel];
    self.changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _changeButton.frame = CGRectMake(Width-90, 215, 60, 30);
    [_changeButton setTitle:@"换一换" forState:UIControlStateNormal];
    [self.contentView addSubview:_changeButton];
    self.professor1 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40, 210+40, (Width-60)/5, Width/10+65)];
    [self.contentView addSubview:_professor1];
    self.professor2 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5, 210+40, (Width-60)/5, Width/10+65)];
    [self.contentView addSubview:_professor2];
    self.professor3 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*2, 210+40, (Width-60)/5, Width/10+65)];
    [self.contentView addSubview:_professor3];
    self.professor4 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*3, 210+40, (Width-60)/5, Width/10+65)];
    [self.contentView addSubview:_professor4];
    self.professor5 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*4, 210+40, (Width-60)/5, Width/10+65)];
    [self.contentView addSubview:_professor5];

    
    
}
@end
