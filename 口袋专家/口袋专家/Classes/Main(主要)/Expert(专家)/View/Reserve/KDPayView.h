//
//  KDPayView.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/26.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDPayView : UIView
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *useLabel;
@property (strong, nonatomic) IBOutlet UIView *outPayView;
@property (weak, nonatomic) IBOutlet UIButton *balanceButton;
@property (weak, nonatomic) IBOutlet UIButton *otherButton;
@property (weak, nonatomic) IBOutlet UIButton *rechargeButton;
@property (weak, nonatomic) IBOutlet UIButton *beforeButton;
@property (weak, nonatomic) IBOutlet UIButton *ensureButton;

+ (instancetype)pay;
@end
