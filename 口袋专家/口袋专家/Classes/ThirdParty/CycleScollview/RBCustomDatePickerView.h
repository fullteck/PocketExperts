//
//  RBCustomDatePickerView.h
//  RBCustomDateTimePicker
//  e-mail:rbyyy924805@163.com
//  Created by renbing on 3/17/14.
//  Copyright (c) 2014 renbing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXSCycleScrollView.h"

@interface RBCustomDatePickerView : UIView <MXSCycleScrollViewDatasource,MXSCycleScrollViewDelegate>
{
    UIView                      *timeBroadcastView;//定时播放显示视图
    MXSCycleScrollView          *yearScrollView;//年份滚动视图
    MXSCycleScrollView          *monthScrollView;//月份滚动视图
    MXSCycleScrollView          *dayScrollView;//日滚动视图
    MXSCycleScrollView          *hourScrollView;//时滚动视图
    MXSCycleScrollView          *minuteScrollView;//分滚动视图
    MXSCycleScrollView          *secondScrollView;//秒滚动视图
    UILabel                     *nowPickerShowTimeLabel;//当前picker显示的时间
    UILabel                     *selectTimeIsNotLegalLabel;//所选时间是否合法
}

@property(nonatomic,strong)UIView * backView;
@property(nonatomic,strong)UILabel * nowPickerShowTimeLabel;
@property(nonatomic,assign)BOOL timeIsOk;
@property(nonatomic,strong)NSString * seleceTime;
@end
