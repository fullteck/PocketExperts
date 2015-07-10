//
//  ListingHeadView.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingHeadView.h"
#import "AFNetworking.h"
#import "KDConst.h"

@interface KDListingHeadView ()
@end
@implementation KDListingHeadView
+ (instancetype)instance {
    return [[[NSBundle mainBundle] loadNibNamed:@"KDListingHeadView" owner:nil options:nil] firstObject];
}
@end
