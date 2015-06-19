//
//  KDExpertTopic.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface KDExpertTopic : NSObject
@property(nonatomic,strong)NSString * intro;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,assign)NSInteger grade;
@property(nonatomic,assign)NSInteger _id;
@property(nonatomic,assign)NSInteger pri;
@property(nonatomic,assign)NSInteger user_id;
@end
