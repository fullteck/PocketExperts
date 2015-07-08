//
//  FirstTableViewCell.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDFirstTableViewCell.h"
#import "KDExpertPicAndName.h"
#import "KDTool.h"
#import "KDConst.h"

@interface KDFirstTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
@implementation KDFirstTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setExpertsArray:(NSArray *)expertsArray
{
    CGFloat padding = (self.bgView.frame.size.width - 180)/4;
//    CGFloat expertW = Width == 320 ? 30 : 45;
//    CGFloat expertH = Width == 320 ? 48 : 65;
    static NSInteger count;
    count = expertsArray.count;
    for (int i = 0; i < count; i++) {
        KDExpertPicAndName *expert = [KDExpertPicAndName picAndName];
        expert.frame = CGRectMake((45 + padding)*i, 0, 45, 65);
        expert.expert = expertsArray[i];
        expert.autoresizingMask = UIViewAutoresizingNone;
        [self.bgView addSubview:expert];
    }
    [KDTool instance].height = CGRectGetMaxY(self.bgView.frame);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
