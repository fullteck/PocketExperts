//
//  ListingHeadView.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingHeadView.h"
#define Width [[UIScreen mainScreen] bounds].size.width

@interface KDListingHeadView ()
@property(nonatomic,strong)UIImageView * markImage;

@end
@implementation KDListingHeadView
+ (instancetype)instance {
    return [[[NSBundle mainBundle] loadNibNamed:@"KDListingHeadView" owner:nil options:nil] firstObject];
}
@end
