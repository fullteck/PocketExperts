//
//  KDExpertJobCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertJobCell.h"
#import "KDHandle.h"

@interface KDExpertJobCell ()
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *begin;

@property (weak, nonatomic) IBOutlet UILabel *end;
@property (weak, nonatomic) IBOutlet UIImageView *buttomView;


@end

@implementation KDExpertJobCell

- (void)awakeFromNib {
    // Initialization code
    [KDHandle shareInstance].cellHeight = CGRectGetMaxY(self.buttomView.frame);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setExpertJob:(KDExpertJob *)expertJob
{
    NSString * startTime = [self getTimeWithNumber:expertJob.start];
    NSString * endTime = [self getTimeWithNumber:expertJob.end];

    self.begin.text = startTime;
    self.end.text = endTime;
    self.company.text = expertJob.name;
    self.job.text = expertJob.job;
}

- (NSString *)getTimeWithNumber:(NSInteger)number
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:number];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString * string = [dateFormatter stringFromDate:date];
    NSRange range = NSMakeRange(0, 10);
    NSString * str = [string substringWithRange:range];
    return str;
}

@end
