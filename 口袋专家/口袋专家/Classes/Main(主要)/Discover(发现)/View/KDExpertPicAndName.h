//
//  ExpertPicAndName.h
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/5.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDTExpertList.h"

@interface KDExpertPicAndName : UIView
@property (nonatomic,strong)KDTexpertList *expert;
+ (instancetype)picAndName;
@end
