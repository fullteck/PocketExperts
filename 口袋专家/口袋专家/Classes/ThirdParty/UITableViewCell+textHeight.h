//
//  UITableViewCell+textHeight.h
//  Lesson11_UI
//
//  Created by lanou3g on 15-1-23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (textHeight)
+ (CGFloat)getTextHeight:(NSString *)text fintSize:(CGFloat)fontSize labelWidth:(CGFloat)width;
@end
