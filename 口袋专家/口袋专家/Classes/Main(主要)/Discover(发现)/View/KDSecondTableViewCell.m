//
//  KDSecondTableViewCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/8.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDSecondTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "KDHandle.h"
@interface KDSecondTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *topicTitle;
@property (weak, nonatomic) IBOutlet UILabel *topicContent;
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;

@end

@implementation KDSecondTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"KDSecondTableViewCell";
    KDSecondTableViewCell * cell = (KDSecondTableViewCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        NSArray * arr = [[NSBundle mainBundle] loadNibNamed:@"KDSecondTableViewCell" owner:self options:nil];
        cell = [arr lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setExpertTopic:(KDDisTopic *)expertTopic
{
    self.topicTitle.text = expertTopic.title;
    self.topicContent.text = expertTopic.intro;
    self.name.text = [expertTopic.expert objectForKey:@"name"];
    self.job.text = [expertTopic.expert objectForKey:@"job"];
    self.headpic.layer.cornerRadius = 22.5;
    self.headpic.layer.masksToBounds = YES;
    NSLog(@"%@",[expertTopic.expert objectForKey:@"avaurl"]);
    [self.headpic sd_setImageWithURL:[NSURL URLWithString:[expertTopic.expert objectForKey:@"avaurl"]]];
    CGFloat height = CGRectGetMaxY(self.headpic.frame);
    [KDHandle shareInstance].cellHeight = height + 40;
}

@end
