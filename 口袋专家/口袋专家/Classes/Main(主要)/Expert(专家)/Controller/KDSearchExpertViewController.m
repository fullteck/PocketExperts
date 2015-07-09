//
//  KDSearchExpertViewController.m
//  口袋专家
//
//  Created by 扶摇直上 on 15/7/1.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDSearchExpertViewController.h"
#import "KDConst.h"


@interface KDSearchExpertViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BOOL tableViewIsAdd;
}
@property(nonatomic,strong)UITextField * searchTF;
@property(nonatomic,strong)UITableView * searchResultTableView;
@property(nonatomic,strong)NSMutableArray * resultArray;
@end

@implementation KDSearchExpertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTitleView];
    [self createKindButton];
}

#pragma mark - 创建titleView
- (void)createTitleView
{
    UIBarButtonItem * rightBI = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(didClickBack:)];
    self.navigationItem.rightBarButtonItem = rightBI;
    [self.navigationItem setHidesBackButton:YES];
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 302.5, 30)];
    UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 302.5, 30)];
    backImage.image = [UIImage imageNamed:@"search box"];
    [titleView addSubview:backImage];
    self.searchTF = [[UITextField alloc] initWithFrame:CGRectMake(27, 0, 302.5-27, 30)];
    _searchTF.placeholder = @"找专家";
    _searchTF.font = [UIFont systemFontOfSize:14];
    _searchTF.delegate = self;
    _searchTF.textColor = [UIColor colorWithRed:120/255.0 green:120/255.0 blue:120/255.0 alpha:1.0];
    _searchTF.returnKeyType = UIReturnKeySearch;
    _searchTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [titleView addSubview:_searchTF];
        self.navigationItem.titleView = titleView;
    
}
#pragma mark - 取消按钮
- (void)didClickBack:(UIBarButtonItem *)BI
{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - 创建分类的button
- (void)createKindButton
{
    NSArray * titleArray =  @[@"媒体",@"自媒体",@"投资人",@"创业者",@"技术",@"设计",@"产品经理",@"营销",@"策划",@"市场",@"公关",@"运营",@"人力资源",@"管理",@"111"];
    CGFloat mid = (Width - 100*3)/4;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = CGRectMake(mid + (mid + 100)*j, 64 + 15+(15+34)*i, 100, 34);
            int num = 3*i+j;
            NSString * title = [titleArray objectAtIndex:num];
            [button setTitle:title forState:UIControlStateNormal];
            if (num == 0) {
                [button setBackgroundImage:[UIImage imageNamed:@"label2"] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor colorWithRed:255/255.0 green:90/255.0 blue:95/255.0 alpha:1.0] forState:UIControlStateNormal];
            }else if (num == 1){
                [button setBackgroundImage:[UIImage imageNamed:@"label3"] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor colorWithRed:93/255.0 green:163/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];

            }else if (num == 2){
                [button setBackgroundImage:[UIImage imageNamed:@"label4"] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor colorWithRed:255/255.0 green:181/255.0 blue:2/255.0 alpha:1.0] forState:UIControlStateNormal];

            }else{
                [button setBackgroundImage:[UIImage imageNamed:@"label1"] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor colorWithRed:69/255.0 green:69/255.0 blue:69/255.0 alpha:1.0] forState:UIControlStateNormal];

            }
            if (num == 14) {
                [button setHidden:YES];
            }
            button.tag = 100+num;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button addTarget:self action:@selector(didClickBackMapWithUrl:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
    
    
}
//button的点击事件
- (void)didClickBackMapWithUrl:(UIButton *)button
{
    [_delegate getSearchResultByClickButton:button.titleLabel.text];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self createTableView];

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_delegate getSearchResultByCLickReturn:textField.text];
    [self.navigationController popViewControllerAnimated:YES];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchTF resignFirstResponder];
}

- (void)createTableView
{
    if (tableViewIsAdd == NO) {
        self.searchResultTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Width, Height-64) style:UITableViewStylePlain];
        _searchResultTableView.delegate = self;
        _searchResultTableView.dataSource = self;
        [self.view addSubview:_searchResultTableView];
        tableViewIsAdd = YES;
    }
}

#pragma mark - UITableView协议中的方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"12"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"12"];
    }
    cell.textLabel.text = @"搜索结果";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点我干啥");
    [_searchResultTableView removeFromSuperview];
    _searchResultTableView = nil;
    tableViewIsAdd = NO;
    NSArray * arr = [NSArray array];
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate getSearchResultByClickTableViewRow:arr];
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
