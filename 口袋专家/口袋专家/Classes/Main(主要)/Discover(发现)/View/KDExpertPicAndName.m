//
//  ExpertPicAndName.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertPicAndName.h"

@implementation KDExpertPicAndName

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
    self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
    _picImage.backgroundColor = [UIColor cyanColor];
    [self addSubview:_picImage];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 60, 50, 20)];
    _nameLabel.text = @"专家姓名";
    _nameLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_nameLabel];
    
}


@end
