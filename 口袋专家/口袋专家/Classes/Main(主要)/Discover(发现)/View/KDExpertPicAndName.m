//
//  ExpertPicAndName.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertPicAndName.h"
#import "UIImageView+WebCache.h"

@interface KDExpertPicAndName ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end
@implementation KDExpertPicAndName
+ (instancetype)picAndName {
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertPicAndName" owner:nil options:nil] firstObject];
}
- (void)setExpert:(KDTexpertList *)expert {
    self.name.text = expert.name;
    NSURL *url = [NSURL URLWithString:expert.avaurl];
    [self.icon sd_setImageWithURL:url];
}


@end
