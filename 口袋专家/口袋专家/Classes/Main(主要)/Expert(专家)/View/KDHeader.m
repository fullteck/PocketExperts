//
//  KDHeader.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/23.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDHeader.h"
#import "KDChatNumberView.h"


@interface KDHeader ()
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UIImageView *headpic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (weak, nonatomic) IBOutlet UILabel *like;

@end
@implementation KDHeader
+ (instancetype)instance
{
    return [[[NSBundle mainBundle] loadNibNamed:@"KDHeader" owner:nil options:nil] firstObject];
}

- (void)awakeFromNib
{
    NSArray * picArr = @[@"baidu logo",@"weixin logo",@"zhihu logo",@"xinlang logo"];
    CGFloat width =  self.buttomView.frame.size.width/4;
    
    CGFloat height = self.buttomView.frame.size.height;
    
    NSLog(@"width = %f,height = %f",width,height);
    NSLog(@"111======%f,%f,%f,%f",self.buttomView.frame.origin.x,self.buttomView.frame.origin.y,self.buttomView.frame.size.width,self.buttomView.frame.size.height);
    for (int i = 0; i < 4; i++) {
        //        UIView * view = [UIView alloc]
        //        KDChatNumberView * view = [[[NSBundle mainBundle] loadNibNamed:@"KDChatNumberView" owner:self options:nil] lastObject];
        KDChatNumberView * view = [KDChatNumberView instance];
        //        view
        //        KDChatNumberView * view = [[KDChatNumberView alloc] initWithFrame:CGRectMake(width*i, 0, width, height)];
        [view setFrame:CGRectMake(width*i, 0, width, height)];
        NSLog(@"22222222====%f,%f,%f,%f",view.frame.origin.x,view.frame.origin.y,view.frame.size.width,view.frame.size.height);
        view.pic.image = [UIImage imageNamed:[picArr objectAtIndex:i]];
        //
        //        KDChatNumberView * view = [[KDChatNumberView alloc] initWithFrame:CGRectMake(width*i, 0, width, height)];
        //        view.pic.image = [UIImage imageNamed:[picArr objectAtIndex:i]];
        //
        //        view.frame = CGRectMake(width*i, 0, width, height);
        [self.buttomView addSubview:view];
    }
    

}

- (void)layoutSubviews
{
 }

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder]) {
//        NSArray * picArr = @[@"baidu logo",@"weixin logo",@"zhihu logo",@"xinlang logo"];
//        NSLog(@"awake");
// 
//    }
//    return self;
//}

- (void)setExpert:(KDExpertList *)expert
{
 

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
