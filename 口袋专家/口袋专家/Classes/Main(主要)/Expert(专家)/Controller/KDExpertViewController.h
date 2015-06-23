//
//  ExpertViewController.h
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/4.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@protocol KDExpertViewControllerDelegate <NSObject>

- (void)KDExpertViewControllerNavigationBar:(ExpertStatus)status;
@end
@interface KDExpertViewController : UIViewController
@property (nonatomic, assign)id<KDExpertViewControllerDelegate> delegate;
@end
