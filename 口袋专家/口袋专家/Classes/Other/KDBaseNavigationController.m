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
    // Do any additional setup after loading the view.
    self.navigationBar.backgroundColor = [UIColor redColor];
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
