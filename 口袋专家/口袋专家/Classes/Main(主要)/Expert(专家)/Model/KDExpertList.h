//
//  KDExpertList.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDExpertList : NSObject
@property(nonatomic,strong)NSDictionary * auth;
@property(nonatomic,strong)NSArray * geo;
@property(nonatomic,assign)NSInteger grade;
@property(nonatomic,assign)NSInteger _id;
@property(nonatomic,strong)NSString * job;
@property(nonatomic,assign)NSInteger meet_c;
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * sex;
@property(nonatomic,strong)NSString * intro;
@property(nonatomic,strong)NSString * fileurl;
@property(nonatomic,strong)NSString * avaurl;

@end
