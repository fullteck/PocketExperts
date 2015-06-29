//
//  FirstTableViewCell.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDFirstTableViewCell.h"
#import "KDExpertPicAndName.h"

@implementation KDFirstTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setExpertsArray:(NSArray *)expertsArray
{
    static NSInteger count;
    count = expertsArray.count;
    if (count > 4) {
        count = 4;
    }
    for (int i = 0; i < count; i++) {
        KDExpertPicAndName *expert = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(70+i*65, 75, 60, 70)];
        expert.expert = expertsArray[i];
        [self.contentView addSubview:expert];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
