//
//  KDDisTopic.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/8.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDDisTopic : NSObject
@property(nonatomic,assign)NSInteger _id;
@property(nonatomic,assign)NSInteger date;
@property(nonatomic,strong)NSDictionary * expert;
@property(nonatomic,strong)NSString * intro;
@property(nonatomic,strong)NSDictionary * stats;
@property(nonatomic,strong)NSString * title;
@property(nonatomic,assign)NSInteger type;
@end
