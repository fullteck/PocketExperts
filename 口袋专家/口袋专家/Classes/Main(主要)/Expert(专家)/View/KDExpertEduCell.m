//
//  KDExpertEduCell.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertEduCell.h"

@implementation KDExpertEduCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setEdu:(KDExpertEdu *)edu
{
    NSString * startTime = [self getTimeWithNumber:edu.start];
    NSString * endTime = [self getTimeWithNumber:edu.end];
    self.startLabel.text = startTime;
    self.endLabel.text = endTime;

    self.major.text = edu.major;
    self.school.text = edu.name;
    self.eduPower.text = edu.dip;
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
