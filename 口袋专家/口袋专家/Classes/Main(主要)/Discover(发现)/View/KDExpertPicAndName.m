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

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.autoresizingMask = UIViewAutoresizingNone;
//        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
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
    self.icon.layer.cornerRadius = self.icon.frame.size.width * 0.5;
    NSLog(@"width = %f,height = %f",self.frame.size.width,self.frame.size.height);
}

@end
