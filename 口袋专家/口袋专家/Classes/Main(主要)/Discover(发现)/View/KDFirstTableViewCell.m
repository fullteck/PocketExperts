//
//  FirstTableViewCell.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDFirstTableViewCell.h"
#import "KDExpertPicAndName.h"

@interface KDFirstTableViewCell () {
    __weak IBOutlet UIView *expert01;
    __weak IBOutlet UIView *expert02;
    __weak IBOutlet UIView *expert03;
    __weak IBOutlet UIView *expert04;
    
}
@end
@implementation KDFirstTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setExpertsArray:(NSArray *)expertsArray
{
    NSMutableArray *experts = [NSMutableArray arrayWithObjects:expert01,expert02,expert03,expert04, nil];
    static NSInteger count;
    count = expertsArray.count;
    for (int i = 0; i < count; i++) {
        KDExpertPicAndName *expert = [KDExpertPicAndName picAndName];
        expert.expert = expertsArray[i];
        [(UIView *)experts[i] addSubview:expert];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
