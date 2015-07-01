//
//  ListingCell.h
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDListModel.h"
#import "KDProfessorView.h"
@interface KDListingCell : UITableViewCell
/** 传进来的数据模型 */
@property(nonatomic,strong)KDListModel *list;
/** 创建 cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
/** 计算 cell 内容的高度 */
+ (CGFloat)cellWithHeight:(NSString *)body;
/** 添加点击事件 */
- (void)addTarget:(id)target action:(SEL)action;
@end
