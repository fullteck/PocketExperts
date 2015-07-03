//
//  KDExpertTeam.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDExpertTeam : NSObject
/** 专家团 ID */
@property (nonatomic ,assign) NSInteger _id;
/** 专家团成员数组 */
@property (nonatomic ,strong) NSArray *expert;
/** 专家人数 */
@property (nonatomic ,assign) NSInteger exp_count;
/** 专家团简介 */
@property (nonatomic ,copy) NSString *intro;
/** 专家团标题 */
@property (nonatomic ,copy) NSString *title;







@end
