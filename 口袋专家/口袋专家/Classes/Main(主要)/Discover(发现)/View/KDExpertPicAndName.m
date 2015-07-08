//
//  ExpertPicAndName.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertPicAndName.h"
#import "UIImageView+WebCache.h"
#import "KDConst.h"

@interface KDExpertPicAndName ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconHeight;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end
@implementation KDExpertPicAndName
+ (instancetype)picAndName {
    return [[[NSBundle mainBundle] loadNibNamed:@"KDExpertPicAndName" owner:nil options:nil] firstObject];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        if (Width == 320) {
            self.iconWidth.constant -= 15;
            self.iconHeight.constant -= 35;
        }
//        self.iconWidth.constant -= Width == 320 ? 15 : 0;
//        self.iconHeight.constant -= Width == 320 ? 15 : 0;;
    }
    return self;
}
- (void)setExpert:(KDTexpertList *)expert {
    self.name.text = expert.name;
    NSURL *url = [NSURL URLWithString:expert.avaurl];
    [self.icon sd_setImageWithURL:url];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = self.frame.size.width * 0.5;
    NSLog(@"%f,%f",self.icon.frame.size.width,self.icon.frame.size.height);
}

@end
