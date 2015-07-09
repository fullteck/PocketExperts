//
//  FirstTableViewCell.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDFirstTableViewCell.h"
#import "KDExpertPicAndName.h"
#import "KDHandle.h"
#import "KDConst.h"

@interface KDFirstTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
@implementation KDFirstTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"KDFirstTableViewCell";
    KDFirstTableViewCell * cell = (KDFirstTableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDFirstTableViewCell" owner:self options:nil];
        cell = [arr lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setExpertsArray:(NSArray *)expertsArray
{
    CGFloat padding = (self.bgView.frame.size.width - 180)/4;
    static NSInteger count;
    count = expertsArray.count;
    for (int i = 0; i < count; i++) {
        KDExpertPicAndName *expert = [KDExpertPicAndName picAndName];
        expert.frame = CGRectMake((45 + padding)*i, 0, 45, 65);
        expert.expert = expertsArray[i];
        expert.autoresizingMask = UIViewAutoresizingNone;
        [self.bgView addSubview:expert];
    }
    [KDHandle shareInstance].cellHeight = CGRectGetMaxY(self.bgView.frame) + 36;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
