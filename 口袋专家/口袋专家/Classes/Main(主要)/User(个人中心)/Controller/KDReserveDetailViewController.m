//
//  KDReserveDetailViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/6.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDReserveDetailViewController.h"
#import "KDConst.h"
#import "UIImageView+WebCache.h"
@interface KDReserveDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headPic;//头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//姓名
@property (weak, nonatomic) IBOutlet UILabel *jobLabel;//职务
@property (weak, nonatomic) IBOutlet UILabel *reserveId;//订单号
@property (weak, nonatomic) IBOutlet UILabel *commitTime;//下单时间
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;//预约状态
@property (weak, nonatomic) IBOutlet UILabel *payStateLabel;//支付状态
@property (weak, nonatomic) IBOutlet UILabel *topicLabel;//话题
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;//预约时间
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;//预约方式
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;//预约地点
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;//价格
@property (weak, nonatomic) IBOutlet UILabel *attachmentLabel;//附件
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;//备注

@end

@implementation KDReserveDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = CGRectMake(0, 64, Width, Height);
    [self getRequestWithDic:_dic];
    
    NSLog(@"crash");
    
}


- (void)getRequestWithDic:(NSMutableDictionary *)dic
{

    NSString * requestId = dic[@"id"];
    NSInteger type = [dic[@"type"] integerValue];
    NSString * urlStr = [NSString stringWithFormat:@"http://182.254.221.13:8080/api/v1.0/appointment/info/%@/%ld",requestId,type];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * dictionary = (NSDictionary *)responseObject[@"app"];
        NSLog(@"dict = %@",dictionary);
        NSDictionary * dic = dictionary[@"info"];
        self.nameLabel.text = dic[@"name"];
        NSLog(@"%@",self.nameLabel.text);
        self.jobLabel.text = dic[@"job"];
        [self.headPic sd_setImageWithURL:[NSURL URLWithString:dic[@"avaurl"]]];
        self.reserveId.text = _dic[@"id"];
        self.commitTime.text = [self getTimeWithNumber:[dictionary[@"data"] integerValue]];
        self.topicLabel.text = [NSString stringWithFormat:@"预约话题: %@",dictionary[@"topic_title"]];
        self.dateLabel.text = [NSString stringWithFormat:@"预约时间: %ld",[dictionary[@"appdate"] integerValue]];
        self.addressLabel.text = [NSString stringWithFormat:@"预约地点: %@",dictionary[@"address"]];
        self.priceLabel.text = [NSString stringWithFormat:@"支付费用: %@",dictionary[@"price"]];
        self.remarkLabel.text = [NSString stringWithFormat:@"备注: %@",dictionary[@"remark"]];
        NSInteger state = [dictionary[@"state"] integerValue];
        NSInteger payState = [dictionary[@"paystate"] integerValue];
        if (state == 0) {
            self.stateLabel.text = @"已取消";
            [self.payStateLabel setHidden:YES];
        }else if (state == 1){
            self.stateLabel.text = @"进行中";
            if (payState == 0) {
                self.payStateLabel.text = @"未支付";
            }else{
                self.payStateLabel.text = @"已支付";
            }
        }else{
            self.stateLabel.text = @"已结束";
            self.payStateLabel.text = @"已录音";
        }
        NSInteger apptype = [dictionary[@"apptypr"] integerValue];
        if (apptype == 0) {
            self.typeLabel.text = @"预约方式: 在线交流";
        }else if (apptype == 1){
            self.typeLabel.text = @"预约方式: 语音交流";
        }else{
            self.typeLabel.text = @"预约方式: 面对面交流";
        }


    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
        
    }];
}

- (void)initWithDictionary:(NSDictionary *)dict
{
//    NSLog(@"%@",dict);
 
    
    
}

- (NSString *)getTimeWithNumber:(NSInteger)number
{
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:number];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString * string = [dateFormatter stringFromDate:date];
    NSRange range = NSMakeRange(0, 10);
    NSString * str = [string substringWithRange:range];
    return str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
