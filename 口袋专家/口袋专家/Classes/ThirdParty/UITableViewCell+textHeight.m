//
//  UITableViewCell+textHeight.m
//  Lesson11_UI
//
//  Created by lanou3g on 15-1-23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "UITableViewCell+textHeight.h"

@implementation UITableViewCell (textHeight)
+ (CGFloat)getTextHeight:(NSString *)text fintSize:(CGFloat)fontSize labelWidth:(CGFloat)width;
{
    //获取文本的高度
    CGSize size = CGSizeMake(width, 100000);
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    NSLog(@"%@",NSStringFromCGRect(rect));
    return rect.size.height;

}

@end
