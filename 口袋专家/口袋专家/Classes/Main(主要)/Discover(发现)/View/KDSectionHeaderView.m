//
//  KDSectionHeaderView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDSectionHeaderView.h"

@interface KDSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
@implementation KDSectionHeaderView
+ (instancetype)sectionHeader
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SectionHeaderView" owner:nil options:nil] lastObject];
}

- (void)addTarget:(id)target action:(SEL)action {
    
    [self.btn  addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
