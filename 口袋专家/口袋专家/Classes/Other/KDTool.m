//
//  KDTool.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/7.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDTool.h"

@implementation KDTool
+ (instancetype)instance {
    static KDTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}
@end
