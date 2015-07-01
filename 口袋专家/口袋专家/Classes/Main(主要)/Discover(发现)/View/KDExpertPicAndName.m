//
//  ExpertPicAndName.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertPicAndName.h"
#import "UIImageView+WebCache.h"

@implementation KDExpertPicAndName
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.picImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - 5, frame.size.width - 5)];
        [self addSubview:_picImage];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picImage.frame), frame.size.width, 20)];
        [self addSubview:_nameLabel];
    }
    return self;
}
- (void)setExpert:(KDTexpertList *)expert {
    self.nameLabel.text = expert.name;
    self.nameLabel.font = [UIFont systemFontOfSize:12];

    NSURL *url = [NSURL URLWithString:expert.avaurl];
    [self.picImage sd_setImageWithURL:url];
    if (expert.job) {
        self.jobLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameLabel.frame), self.frame.size.width, 20)];
        self.jobLabel.text = expert.job;
        self.jobLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_jobLabel];
    }

}


@end
