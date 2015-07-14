//
//  ListingCell.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingCell.h"
#import "KDExpertPicAndName.h"
#import "UITableViewCell+textHeight.h"
#import "KDConst.h"
#import "KDHandle.h"
#define DefaultFrameY 10.0f
#define LabelFont [UIFont systemFontOfSize:15.0f]
#define BubbleMaxSize CGSizeMake(180.0f, 1000.0f)
#define SUBWIDTH self.frame.size.width - 70.0f


@interface KDListingCell () {
    UILabel     *_expertTitle;  /** 专家团标题 */
    BOOL        _isLoad;
}
/** 专家团背景 */
@property (weak, nonatomic) IBOutlet UIView *bgView;
/** 专家团按钮 */
@property (weak, nonatomic) IBOutlet UIButton *expertsBtn;
/** 喜欢的人数 */
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
/** 清单的内容 */
@property (weak, nonatomic) IBOutlet UILabel *content;
/** 清单的标题 */
@property (weak, nonatomic) IBOutlet UILabel *title;
/** 气泡背景 */
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
/** 气泡图片 */
@property (weak, nonatomic) IBOutlet UIImageView *bubleimg;

@end

@implementation KDListingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"KDListingCell";
    KDListingCell * cell = (KDListingCell *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KDListingCell" owner:self options:nil] firstObject];
    }
    cell.backgroundColor = BGColor;
    
    return cell;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - 子控件的赋值
- (void)setList:(KDListModel *)list {
    _list = list;
    _title.text = list.title;
    _content.text = list.content;
    CGFloat padding = self.bgView.frame.size.width/4;
    NSLog(@"%f",self.bgView.frame.size.width);
    NSLog(@"%f",padding);

    static NSInteger count;
    count = _list.expert.count;
    for (int i = 0; i < count; i++) {
        KDExpertPicAndName *expert = [KDExpertPicAndName picAndName];
        expert.frame = CGRectMake((padding - 10)*i, 0, padding-10, padding);
        expert.expert = _list.expert[i];
        NSLog(@"%f,%f",expert.frame.size.width,expert.frame.size.height);
        [self.bgView addSubview:expert];
    }
    [KDHandle shareInstance].cellHeight = CGRectGetMaxY(self.bgView.frame) + 36;
}

#pragma mark - 按钮的点击事件
- (void)addTarget:(id)target action:(SEL)action {
    [_expertsBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 计算高度
+ (CGFloat)cellWithHeight:(NSString *)body {
    CGFloat height = 90.0f;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize bubbleSize = [body sizeWithFont:LabelFont constrainedToSize:BubbleMaxSize lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    
    if (bubbleSize.height>45.0f) {
        height = bubbleSize.height + 45.0f;
    }
    return height;
}
@end
