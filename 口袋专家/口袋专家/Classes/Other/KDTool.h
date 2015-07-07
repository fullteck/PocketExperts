//
//  KDTool.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/7.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDTool : NSObject
/** 存储 cell 的高度 */
@property (nonatomic, assign) NSInteger height;
/** 单例 */
+ (instancetype)instance;
@end
