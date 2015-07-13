//
//  KDHeader.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDHeader.h"
#import <QuartzCore/QuartzCore.h>

@interface KDHeader ()
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UILabel *like;
@property (weak, nonatomic) IBOutlet UILabel *shuoming;
@property (weak, nonatomic) IBOutlet UIView *border;


@end
@implementation KDHeader
+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDHeader" owner:nil options:nil] firstObject];
}


- (void)awakeFromNib
{
    
    self.border.layer.borderColor = [[UIColor redColor] CGColor];
    self.border.layer.borderWidth = 0.5;
    self.border.layer.cornerRadius = 2;
}

- (void)setExpert:(KDExpertList *)expert
{
 

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
