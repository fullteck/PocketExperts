//
//  KDExpertIntroHeader.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/24.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDExpertIntroHeader : UIView
+ (instancetype)instance;

- (CGFloat)getHeight;
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *introduce;

@end
