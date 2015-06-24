//
//  KDHeader.h
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDExpertList.h"
@interface KDHeader : UIView
@property(nonatomic,strong)KDExpertList * expert;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;
@property (weak, nonatomic) IBOutlet UIImageView *autoImage;
@property (weak, nonatomic) IBOutlet UIImageView *vipImage;



+ (instancetype)instance;

@end
