//
//  DiscoverTableViewController.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/4.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDDiscoverTableViewController.h"
#import "KDListingViewController.h"
#import "KDFirstTableViewCell.h"
#import "KDConst.h"
#import "KDExpertTeamTableViewController.h"


#define Width [[UIScreen mainScreen] bounds].size.width

@interface KDDiscoverTableViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer * timer;
@end

@implementation KDDiscoverTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        
//    self.tableView.frame = CGRectMake(0, 65, ScreenW, ScreenH - 65);
    self.automaticallyAdjustsScrollViewInsets = NO;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发现";
    
    // self.clearsSelectionOnViewWillAppear = NO;

    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self initWithImageAndPageControl];

}

- (void)initWithImageAndPageControl
{
    self.scrollView = [[UIScrollView alloc] init];
    
    self.scrollView.frame = CGRectMake(0, 0, 0, 180);
    
    self.scrollView.contentSize = CGSizeMake(Width*10, 0);
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 10; i++) {
        UIImageView * picImage = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, 200)];
        picImage.tag = 100+i;
        picImage.backgroundColor = [UIColor redColor];
        [self.scrollView addSubview:picImage];
    }
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Width/3, 130, 150, 50)];
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.numberOfPages = 10;
    
    [self.tableView addSubview:self.pageControl];
    
    [self.tableView bringSubviewToFront:self.pageControl];
    
    [self.pageControl addTarget:self action:@selector(didClickPageChange:) forControlEvents:UIControlEventValueChanged];
    [self addTimer];
    [self.scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didEnterListing:)]];
    
    self.tableView.tableHeaderView = self.scrollView;
    
    [self.tableView addSubview:self.pageControl];
    
    self.scrollView.delegate = self;
}
//点击pageControl
- (void)didClickPageChange:(UIPageControl *)pageControl
{
    NSLog(@"====");
    
}
#pragma mark-----------定时器
//添加定时器
- (void)addTimer
{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
//换到图片的下一张
- (void)nextImage
{
    int page=(int)self.pageControl.currentPage;
    if (page==9) {
        page=0;
    }else
    {
        page++;
    }
    //滚动scrollview
    CGFloat X=page *self.scrollView.frame.size.width;
    self.scrollView.contentOffset=CGPointMake(X, 0);
    
}
//移除定时器
- (void)removieTimer
{
    [self.timer invalidate];
}
#pragma mark----------UIScrollViewDelegate
//结束滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        int page = scrollView.contentOffset.x/Width;
        self.pageControl.currentPage = page;
    }
}
//将要滑动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        [self removieTimer];
    }
}
//结束滑动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView == _scrollView) {
        [self addTimer];
    }
}
#pragma mark--------点击轮播图触发的事件
- (void)didEnterListing:(UITapGestureRecognizer *)GR
{
    KDListingViewController * listingVC = [[KDListingViewController alloc] init];
    [self.navigationController pushViewController:listingVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"First";
    BOOL nibResgistered = NO;
    if (!nibResgistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDFirstTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        nibResgistered = YES;
    }
    KDFirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 155;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertTeamTableViewController *etTVC = [[KDExpertTeamTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController pushViewController:etTVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
