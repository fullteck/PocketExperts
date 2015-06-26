//
//  KDExpertTeam.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDExpertTeam : NSObject
@property (nonatomic ,assign) NSInteger _id;
@property (nonatomic ,strong) NSArray *expert;
@property (nonatomic ,assign) NSInteger grade;
@property (nonatomic ,copy) NSString *intro;
@property (nonatomic ,assign) NSInteger pri;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,assign) NSInteger user_id;






@end
