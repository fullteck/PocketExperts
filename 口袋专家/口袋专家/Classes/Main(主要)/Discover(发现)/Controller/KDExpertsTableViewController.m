//
//  KDExpertsTableViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/6/25.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDExpertsTableViewController.h"
#import "KDExpertListCell.h"

@interface KDExpertsTableViewController ()

@end

@implementation KDExpertsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"expertsCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([KDExpertListCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:ID];
        nibsRegistered = YES;
    }
    KDExpertListCell *cell = (KDExpertListCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    
    return cell;
}
@end
