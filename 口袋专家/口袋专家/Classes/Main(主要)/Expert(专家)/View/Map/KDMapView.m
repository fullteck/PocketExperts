//
//  KDMapView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/30.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDMapView.h"
#import "UIImageView+WebCache.h"

@interface KDMapView ()
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UILabel *commentNum;

@end


@implementation KDMapView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setExpert:(KDExpertList *)expert
{
    self.name.text = expert.name;
    self.job.text = expert.job;
    [self.headpic sd_setImageWithURL:[NSURL URLWithString:expert.avaurl]];
    self.headpic.layer.cornerRadius = 30;
    self.headpic.layer.masksToBounds = YES;
}

+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDMapView" owner:nil options:nil] firstObject];

}

@end
