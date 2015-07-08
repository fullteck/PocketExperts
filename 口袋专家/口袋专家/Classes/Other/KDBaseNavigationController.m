//
//  KDBaseNavigationController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/18.
//  Copyright © 2015年 扶摇直上. All rights reserved.
//

#import "KDBaseNavigationController.h"

@interface KDBaseNavigationController ()

@end

@implementation KDBaseNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    //选择自己喜欢的颜色
    UIColor * color = [UIColor whiteColor];
    
    //这里我们设置的是颜色，还可以设置shadow等，具体可以参见api
    NSDictionary * dict = [NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    
    self.navigationBar.titleTextAttributes = dict;
    self.navigationBar.barTintColor = [UIColor colorWithRed:93/255.0 green:163/255.0 blue:1.0 alpha:1.0];
    // Do any additional setup after loading the view.    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
