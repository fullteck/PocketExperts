//
//  ExpertMapViewController.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDSearchExpertViewController.h"

@interface KDExpertMapViewController : UIViewController<KDSearchExpertOnMap>

@property(nonatomic,strong)NSMutableArray * expertArray;//用来接收传过来的数据

@end
