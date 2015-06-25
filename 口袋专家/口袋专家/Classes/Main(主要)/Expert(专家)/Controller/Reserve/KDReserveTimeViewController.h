//
//  KDReserveTimeViewController.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Block)(void);

@interface KDReserveTimeViewController : UIViewController
@property(nonatomic,strong)NSMutableDictionary * infroDic;
@property(nonatomic,copy)Block block;
@end
