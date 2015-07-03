//
//  ListingHeadView.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingHeadView.h"
#define Width [[UIScreen mainScreen] bounds].size.width
@implementation KDListingHeadView
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
    self.markImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    _markImage.backgroundColor = [UIColor blackColor];
    [self addSubview:_markImage];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 10, Width-65, 40)];
    _titleLabel.text = @"创业者应该自问的十个问题";
    [self addSubview:_titleLabel];
    self.personLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 52, 60, 30)];
    _personLabel.font = [UIFont systemFontOfSize:16];
    _personLabel.text = @"媒体人";
    _personLabel.textColor = [UIColor grayColor];
    [self addSubview:_personLabel];
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 52, 60, 30)];
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:16];
    _timeLabel.text = @"1小时前";
    [self addSubview:_timeLabel];
}

@end
