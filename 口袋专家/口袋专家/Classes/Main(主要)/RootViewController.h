//
//  RootViewController.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/19.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ExpertStatusList,
    ExpertStatusMap
} ExpertStatus;

@protocol KDRootViewControllerDelegate <NSObject>

- (void)KDRootViewControllerChangeStatus:(ExpertStatus)status;

@end
@interface RootViewController : UIViewController
@property (nonatomic, assign)id<KDRootViewControllerDelegate> delegate;
@end
