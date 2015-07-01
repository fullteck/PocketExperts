//
//  KDListModel.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/30.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDListModel : NSObject
@property (nonatomic ,copy) NSString *_id;
@property (nonatomic ,copy) NSString *content;
@property (nonatomic ,strong) NSArray *expert;
@property (nonatomic ,assign) NSInteger sort;
@property (nonatomic ,copy) NSString *title;
@end
