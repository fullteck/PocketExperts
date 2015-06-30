//
//  ListingCell.m
//  TXmap
//
//  Created by 扶摇直上 on 15/6/3.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDListingCell.h"
#import "UITableViewCell+textHeight.h"
#import "KDConst.h"
#define DefaultFrameY 10.0f
#define LabelFont [UIFont systemFontOfSize:15.0f]
#define BubbleMaxSize CGSizeMake(180.0f, 1000.0f)


@interface KDListingCell () {
    UIView *_bubbleView;            /** 背景气泡图片 */
    UILabel *_title;            /** 清单的标题 */
    UIImageView *_midLine;      /** 中间的分割线 */
}
@end
@implementation KDListingCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"listing";
    KDListingCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[KDListingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
//    self.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    UIImageView *leftLine = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, 0, 1, self.frame.size.height)];
//    leftLine.backgroundColor = [UIColor whiteColor];
//    [self.contentView addSubview:leftLine];
//    
//    UIImageView *leftDot = [[UIImageView alloc] initWithFrame:CGRectMake(23.0f, 20.0f, 15, 15)];
//    leftDot.image = [UIImage imageNamed:@"iconfont-yuandian"];
//    [self.contentView addSubview:leftDot];
//    
//    CGFloat titleHeight = [UITableViewCell getTextHeight:_title.text fintSize:15.0f labelWidth:self.frame.size.width-20];
//    
//    _title = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, self.frame.size.width, titleHeight)];
//    [_bubbleView addSubview:_title];
//    
//    CGFloat contentHeight = [UITableViewCell getTextHeight:self.content.text fintSize:15.0f labelWidth:self.frame.size.width-20]
//    self.content = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, height + DefaultFrameY, _bubbleView.frame.size.width-15.0f, _bubbleView.frame.size.height-6.0f)];
//    _content.numberOfLines = 0;
//    _content.font = LabelFont;
//    _content.lineBreakMode = NSLineBreakByCharWrapping;
//    _content.backgroundColor = [UIColor clearColor];
//    [_bubbleView addSubview:_content];
//    
//    
//    _bubbleView = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 10, self.frame.size.width-20, self.frame.size.height-10)];
//    UIImageView *bubleimg = [[UIImageView alloc] initWithFrame:_bubbleView.bounds];
//    bubleimg.image = [[UIImage imageNamed:@"chat_receiver_bg"] stretchableImageWithLeftCapWidth:33.0f topCapHeight:33.0f];
//    bubleimg.tag = 1000;
//    [_bubbleView addSubview:bubleimg];
//    bubleimg.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    [self.contentView addSubview:_bubbleView];
//    
//
    
//    _content.frame = CGRectMake(16.0f, 2.0f, self.bubbleSize.width, self.bubbleSize.height);
//    self.bubbleView.frame = CGRectMake(self.portraitImg.frame.origin.x+self.portraitImg.frame.size.width+10.0f, self.portraitImg.frame.origin.y, bubbleSize.width+25.0f, bubbleSize.height+6.0f);
    
    
//    self.portraitImg = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 0, 1.0f, self.frame.size.height)];
//    self.portraitImg.contentMode = UIViewContentModeScaleAspectFit;
//    [self.contentView addSubview:self.portraitImg];
//    
//    self.portraitImg.image =  [DemoGlobalClass sharedInstance].sex==ECSexType_Female?[UIImage imageNamed:@"female_default_head_img"]:[UIImage imageNamed:@"male_default_head_img"];
//    
//    self.bubbleView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width-self.portraitImg.frame.origin.x-40.0f-10.0f, self.portraitImg.frame.origin.y, 40.0f, self.portraitImg.frame.size.height)];
//    UIImageView *bubleimg = [[UIImageView alloc] initWithFrame:self.bubbleView.bounds];
//    bubleimg.image = [[UIImage imageNamed:@"chat_sender_bg"] stretchableImageWithLeftCapWidth:33.0f topCapHeight:33.0f];
//    bubleimg.tag = 1000;
//    [self.bubbleView addSubview:bubleimg];
//    bubleimg.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    [self.contentView addSubview:self.bubbleView];
//    
//    _sendStatusView = [[UIView alloc] initWithFrame:CGRectMake(self.bubbleView.frame.origin.x-25.0f, 10.0f, 20.0f, 20.0f)];
//    _sendStatusView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
//    _sendStatusView.backgroundColor = self.backgroundColor;
//    [self.contentView addSubview:_sendStatusView];
//    
//    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    [_sendStatusView addSubview:_activityView];
//    _activityView.backgroundColor = [UIColor clearColor];
//    
//    _retryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_sendStatusView addSubview:_retryBtn];
//    _retryBtn.frame = CGRectMake(0, 0, 28, 28);
//    [_retryBtn setImage:[UIImage imageNamed:@"messageSendFailed"] forState:UIControlStateNormal];
//    [_retryBtn setHidden:YES];
//    [_retryBtn addTarget:self action:@selector(resendBtnTap:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 40, 20)];
//    _numberLabel.backgroundColor = [UIColor grayColor];
//    [self.contentView addSubview:_numberLabel];
//    self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, Width-60, 350)];
//    _backImage.backgroundColor = [UIColor grayColor];
//    [self.contentView addSubview:_backImage];
//    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Width - 80, 200)];
//    _contentLabel.text = @"北京（Beijing;Peking），中华人民共和国的首都、直辖市、国家中心城市，是中国的政治、文化中心，全国重要的交通枢纽和最大空港，国家经济的决策和管理中心，是中华人民共和国中央人民政府和全国人民代表大会的办公所在地。\n北京位于华北平原北部，背靠燕山，毗邻天津市和河北省。北京市下辖东城区、西城区、朝阳区、海淀区、丰台区、石景山区、门头沟区、房山区、大兴区、通州区、顺义区、昌平区、平谷区、怀柔区、密云县、延庆县等16个区县。2014年末，北京市常住人口2151.6万人。\n北京是中国“八大古都”之一，拥有7项世界遗产，是世界上拥有世界文化遗产数最多的城市，是一座有着三千余年建城史、八百六十余年建都史的历史文化名城，拥有众多名胜古迹和人文景观。";
//    _contentLabel.numberOfLines = 0;
//    _contentLabel.font = [UIFont systemFontOfSize:16];
//    [_backImage addSubview:_contentLabel];
//    UILabel * recommendLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 215, 60, 30)];
//    recommendLabel.text = @"推荐专家";
//    recommendLabel.font = [UIFont systemFontOfSize:14];
//    [_backImage addSubview:recommendLabel];
//    self.changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _changeButton.frame = CGRectMake(Width-90, 215, 60, 30);
//    [_changeButton setTitle:@"换一换" forState:UIControlStateNormal];
//    [self.contentView addSubview:_changeButton];
//    self.professor1 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40, 210+40, (Width-60)/5, Width/10+65)];
//    [self.contentView addSubview:_professor1];
//    self.professor2 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5, 210+40, (Width-60)/5, Width/10+65)];
//    [self.contentView addSubview:_professor2];
//    self.professor3 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*2, 210+40, (Width-60)/5, Width/10+65)];
//    [self.contentView addSubview:_professor3];
//    self.professor4 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*3, 210+40, (Width-60)/5, Width/10+65)];
//    [self.contentView addSubview:_professor4];
//    self.professor5 = [[KDProfessorView alloc] initWithFrame:CGRectMake(40+(Width-60)/5*4, 210+40, (Width-60)/5, Width/10+65)];
//    [self.contentView addSubview:_professor5];
}
+ (CGFloat)cellWithHeight:(NSString *)body {
    CGFloat height = 65.0f;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize bubbleSize = [body sizeWithFont:LabelFont constrainedToSize:BubbleMaxSize lineBreakMode:NSLineBreakByCharWrapping];
#pragma clang diagnostic pop
    
    if (bubbleSize.height>45.0f) {
        height = bubbleSize.height+20.0f;
    }
    return height;

}
@end
