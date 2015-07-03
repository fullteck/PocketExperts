//
//  KDHandle.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDHandle.h"

@implementation KDHandle

+ (KDHandle *)shareInstance
{
    static KDHandle * handle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[self alloc] init];
    });
    return handle;

}

@end
