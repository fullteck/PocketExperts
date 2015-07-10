//
//  KDMapView.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/30.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertList.h"
@interface KDMapView : UIView
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property(nonatomic,strong)KDExpertList * expert;

+ (instancetype)instance;

@end
