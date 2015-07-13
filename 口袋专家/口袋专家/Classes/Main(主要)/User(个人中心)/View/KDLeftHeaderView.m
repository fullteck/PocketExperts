//
//  KDLeftHeaderView.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/13.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDLeftHeaderView.h"

@interface KDLeftHeaderView ()
@property (weak, nonatomic) IBOutlet UIButton *bgBtn;

@end
@implementation KDLeftHeaderView
+ (instancetype)instance {
    return [[[NSBundle mainBundle] loadNibNamed:@"KDLeftHeaderView" owner:nil options:nil] firstObject];
}
- (void)addTarget:(id)target action:(SEL)action {
    [self.bgBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
