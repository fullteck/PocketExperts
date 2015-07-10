//
//  KDSearchExpertViewController.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/1.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KDSearchExpertOnMap <NSObject>
- (void)getSearchResultByClickButton:(NSString *)kindStr;//点击类别
- (void)getSearchResultByCLickReturn:(NSString *)textStr;//点击键盘的return键直接返回地图
- (void)getSearchResultByClickTableViewRow:(NSArray *)resultArray;//点击tableview的row返回地图
- (void)getRequestByUrl:(NSString *)url;

@end

@interface KDSearchExpertViewController : UIViewController
@property(nonatomic,assign)id<KDSearchExpertOnMap>delegate;
@end
