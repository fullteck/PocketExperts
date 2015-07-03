//
//  KDTexpertList.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/29.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDTexpertList : NSObject
/** 专家 ID */
@property (nonatomic ,assign) NSInteger _id;
/** 专家头像地址 */
@property (nonatomic ,copy) NSString *avaurl;
/** 专家姓名 */
@property (nonatomic ,copy) NSString *name;
/** 专家职务 */
@property (nonatomic ,copy) NSString *job;
@end
