//
//  ProfessorView.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDProfessorView.h"
#define Width [[UIScreen mainScreen] bounds].size.width

@implementation KDProfessorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}


- (void)createSubviews
{
    self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(Width/5/4, 5, Width/10, Width/10)];
    _picImage.backgroundColor = [UIColor blackColor];
    [self addSubview:_picImage];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width/20, 5+Width/10, Width/10, 30)];
    _nameLabel.text = @"专家名字";
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    self.positionLabel = [[UILabel alloc] initWithFrame:CGRectMake(Width/20, 5+Width/10+30, Width/10, 30)];
    _positionLabel.text = @"专家职务";
    _positionLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_positionLabel];
    self.positionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _positionButton.frame = self.frame;
    [self addSubview:_positionButton];
}
@end
