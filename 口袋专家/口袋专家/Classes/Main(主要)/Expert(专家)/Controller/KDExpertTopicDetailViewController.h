//
//  KDExpertTopicDetailViewController.h
//  口袋专家
//
//  Created by 赵永杰 on 15/7/13.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertList.h"
@interface KDExpertTopicDetailViewController : UIViewController
@property(nonatomic,strong)NSString * topic;
@property(nonatomic,strong)KDExpertList * expert;
@end
