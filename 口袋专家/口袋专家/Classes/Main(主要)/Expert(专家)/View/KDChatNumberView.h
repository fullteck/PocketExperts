//
//  KDChatNumberView.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/10.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDChatNumberView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *num;

+ (instancetype)instance;


@end
