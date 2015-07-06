//
//  KDMyReserve.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/6.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDMyReserve : NSObject
@property(nonatomic,strong)NSString * _id;
@property(nonatomic,assign)NSInteger appdate;
@property(nonatomic,assign)NSInteger appid;
@property(nonatomic,strong)NSDictionary * info;
@property(nonatomic,assign)NSInteger paystate;
@property(nonatomic,assign)NSInteger price;
@property(nonatomic,assign)NSInteger state;
@property(nonatomic,assign)NSInteger topic_id;
@property(nonatomic,strong)NSString * topic_title;
@property(nonatomic,assign)NSInteger user_id;
@end
