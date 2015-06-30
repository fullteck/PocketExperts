//
//  KDMapView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/30.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDMapView.h"

@implementation KDMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    self.headPic = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
    _headPic.backgroundColor = [UIColor cyanColor];
    [self addSubview:_headPic];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 5, 100, 40)];
    _nameLabel.text = @"马化腾";
    [self addSubview:_nameLabel];
    self.jobLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 50, 100, 40)];
    _jobLabel.text = @"CEO";
    [self addSubview:_jobLabel];
}
@end
