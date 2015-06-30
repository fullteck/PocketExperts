//
//  AppDelegate.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/18.
//  Copyright © 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager * _mapManager;
}
@property (strong, nonatomic) UIWindow *window;



@end

