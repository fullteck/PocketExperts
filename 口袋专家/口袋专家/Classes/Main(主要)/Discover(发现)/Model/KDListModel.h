//
//  KDListModel.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/30.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDListModel : NSObject
/** 清单 ID */
@property (nonatomic ,copy) NSString *_id;
/** 清单内容 */
@property (nonatomic ,copy) NSString *content;
/** 清单里的专家团数组 */
@property (nonatomic ,strong) NSArray *expert;
/** 排序 */
@property (nonatomic ,assign) NSInteger sort;
/** 清单标题 */
@property (nonatomic ,copy) NSString *title;
@end
