//
//  KDExpertJob.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDExpertJob : NSObject
@property(nonatomic,assign)NSInteger start;//开始时间
@property(nonatomic,assign)NSInteger end;//结束时间
@property(nonatomic,strong)NSString * job;//职位
@property(nonatomic,strong)NSString * name;//公司名称
@property(nonatomic,strong)NSString * intro;//简介
@end
