//
//  KDExpertTeam.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertTeam.h"
#import "MJExtension.h"
#import "KDTexpertList.h"

@implementation KDExpertTeam
- (NSArray *)expert
{
    NSArray *array = [KDTexpertList objectArrayWithKeyValuesArray:_expert];
    return array;
}
@end
