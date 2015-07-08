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
#define DefaultFrameY 10.0f
#define LabelFont [UIFont systemFontOfSize:15.0f]
#define BubbleMaxSize CGSizeMake(180.0f, 1000.0f)
#define SUBWIDTH self.frame.size.width - 70.0f


@interface KDListingCell () {
    UILabel     *_content;      /** 清单的内容 */
    UILabel     *_title;        /** 清单的标题 */
    UIView      *_bubbleView;   /** 背景气泡图片 */
    UIImageView *_midLine;      /** 中间的分割线 */
    UIButton    *_changeButton; /** 清单详情里的专家团按钮 */
    UIImageView *_leftLine;     /** 清单详情左边的竖线 */
    UIButton    *_expertsBtn;   /** 专家团按钮 */
    UILabel     *_expertTitle;  /** 专家团标题 */
    BOOL        _isLoad;
}
@end

@implementation KDListingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString * identifier = @"listing";
    BOOL nibResgistered = NO;
    if (!nibResgistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDListingCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        nibResgistered = YES;
    }
    KDListingCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self createSubviews];
    }
    return self;
}

#pragma mark - 创建子控件
- (void)createSubviews {
    self.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _leftLine = [[UIImageView alloc] init];
    _leftLine.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_leftLine];

    UIImageView *leftDot = [[UIImageView alloc] initWithFrame:CGRectMake(28.0f, 22.0f, 15, 15)];
    leftDot.image = [UIImage imageNamed:@"point"];
    [self.contentView addSubview:leftDot];
    
    _title = [[UILabel alloc] init];
    _title.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:19];
    _title.textColor = [UIColor colorWithRed:93/255.0 green:163/255.0 blue:1.0 alpha:1.0];

    _content = [[UILabel alloc] init];
    _content.numberOfLines = 0;
    _content.font = [UIFont fontWithName:@"STHeitiSC-Light" size:14];
    _content.lineBreakMode = NSLineBreakByCharWrapping;
    
    _expertsBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    _midLine = [[UIImageView alloc] init];
    _midLine.backgroundColor = [UIColor lightGrayColor];
    
    _expertTitle = [[UILabel alloc] init];
    _expertTitle.font = LabelFont;

    _bubbleView = [[UIView alloc] init];
    UIImageView *bubleimg = [[UIImageView alloc] initWithFrame:_bubbleView.bounds];
    bubleimg.image = [[UIImage imageNamed:@"chat_receiver_bg"] stretchableImageWithLeftCapWidth:33.0f topCapHeight:33.0f];
    [_bubbleView addSubview:bubleimg];
    bubleimg.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.contentView addSubview:_bubbleView];
    
    _isLoad = NO;
}
#pragma mark - 加载 frame
- (void)loadFrame{
    //title 的 frame
    CGFloat titleHeight = [UITableViewCell getTextHeight:_title.text fintSize:15.0f labelWidth:self.frame.size.width-20];
    CGFloat titleX = DefaultFrameY*2;
    CGFloat titleY = DefaultFrameY;
    CGFloat titleW = SUBWIDTH - 30;
    CGFloat titleH = titleHeight;
    _title.frame = CGRectMake(titleX, titleY, titleW, titleH);
    if (_title) {
        [_bubbleView addSubview:_title];
    }
    
    //content 的 frame
    CGFloat contentHeight = [UITableViewCell getTextHeight:_content.text fintSize:15.0f labelWidth:self.frame.size.width-20];
    CGFloat contentX = titleX;
    CGFloat contentY = CGRectGetMaxY(_title.frame) + DefaultFrameY;
    CGFloat contentW = SUBWIDTH - 50;
    CGFloat contentH = contentHeight;
    _content.frame = CGRectMake(contentX, contentY, contentW, contentH);
    [_bubbleView addSubview:_content];
    
    //expertsBtn 的 frame
    CGFloat expertsBtnX = titleX;
    CGFloat expertsBtnY = CGRectGetMaxY(_content.frame) + DefaultFrameY;
    CGFloat expertsBtnW = SUBWIDTH;
    CGFloat expertsBtnH = 120.0f;
    _expertsBtn.frame = CGRectMake(expertsBtnX, expertsBtnY, expertsBtnW, expertsBtnH);
    [_bubbleView addSubview:_expertsBtn];
    
    //bubbleView 的 frame
    CGFloat bubbleViewX = DefaultFrameY*5;
    CGFloat bubbleViewY = DefaultFrameY;
    CGFloat bubbleViewW = SUBWIDTH - 20;
    CGFloat bubbleViewH = CGRectGetMaxY(_expertsBtn.frame) + DefaultFrameY;
    _bubbleView.frame = CGRectMake(bubbleViewX, bubbleViewY, bubbleViewW, bubbleViewH);
    
    //leftLine 的 frame
    CGFloat leftLineX = DefaultFrameY*3+5;
    CGFloat leftLineY = -10;
    CGFloat leftLineW = 1;
    CGFloat leftLineH = CGRectGetMaxY(_bubbleView.frame)+20.0f;
    _leftLine.frame = CGRectMake(leftLineX, leftLineY, leftLineW, leftLineH);
    
    //midLine 的 frame
    CGFloat midLineX = DefaultFrameY;
    CGFloat midLineY = CGRectGetMaxY(_content.frame)+DefaultFrameY;
    CGFloat midLineW = SUBWIDTH - DefaultFrameY - 20;
    CGFloat midLineH = 1;
    _midLine.frame = CGRectMake(midLineX, midLineY, midLineW, midLineH);
    [_bubbleView addSubview:_midLine];
    
    _expertTitle.frame = CGRectMake(0, 0, SUBWIDTH, 30);
    _expertTitle.text = @"推荐专家";
    [_expertsBtn addSubview:_expertTitle];
    
    for (int i = 0; i < self.list.expert.count; i++) {
        CGFloat expertW = (self.frame.size.width - 110)/4;
        CGFloat expertH = expertW + 10.0f;
        KDExpertPicAndName *expert = [[KDExpertPicAndName alloc] initWithFrame:CGRectMake(10+i*expertW, 30, expertW, expertH)];
        expert.expert = self.list.expert[i];
        [_expertsBtn addSubview:expert];
    }
}

#pragma mark - 布局子控件
- (void)layoutSubviews {
    if (_isLoad == NO) {
        [self loadFrame];
        _isLoad = YES;
    }
}

#pragma mark - 子控件的赋值
- (void)setList:(KDListModel *)list {
    _list = list;
    _title.text = list.title;
    _content.text = list.content;
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
