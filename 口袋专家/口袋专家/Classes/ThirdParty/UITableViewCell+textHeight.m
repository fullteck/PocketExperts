

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
