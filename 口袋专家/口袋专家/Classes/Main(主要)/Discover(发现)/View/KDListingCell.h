//
//  ListingCell.h
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDProfessorView.h"
@interface KDListingCell : UITableViewCell
@property(nonatomic,strong)UILabel * numberLabel;
@property(nonatomic,strong)UIImageView * backImage;
/** 清单的内容 */
@property(nonatomic,strong)UILabel * content;
@property(nonatomic,strong)UIButton * changeButton;
@property(nonatomic,strong)KDProfessorView * professor1;
@property(nonatomic,strong)KDProfessorView * professor2;
@property(nonatomic,strong)KDProfessorView * professor3;
@property(nonatomic,strong)KDProfessorView * professor4;
@property(nonatomic,strong)KDProfessorView * professor5;
/** 创建 cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
/** 计算 cell 内容的高度 */
+ (CGFloat)cellWithHeight:(NSString *)body;
@end
