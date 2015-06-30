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
#import "AFNetworking.h"
#import "MJExtension.h"
#import "KDTopicScroll.h"
#import "KDExpertTeam.h"
#import "UIImageView+WebCache.h"
#import "KDExpertList.h"

@interface KDDiscoverTableViewController ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;      /** 顶部的 scrollView */
    UIPageControl *_pageControl;    /** 顶部的 pageController */
    NSTimer * _timer;               /** 定时器 */
}
/** 存储顶部 scrollview 数据的数组 */
@property (nonatomic, strong) NSMutableArray *scrollArray;
/** 存储话题数据的数组 */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 存储专家团的数组 */
@property (nonatomic, strong) NSMutableArray *expertsArray;

@end

@implementation KDDiscoverTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super initWithStyle:style]) {
        
    self.automaticallyAdjustsScrollViewInsets = NO;

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发现";
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.tableView.showsVerticalScrollIndicator = NO;

}

- (NSMutableArray *)scrollArray {
    if (_scrollArray == nil) {
        _scrollArray = [NSMutableArray arrayWithCapacity:10];
     }
    return _scrollArray;
}

- (NSMutableArray *)expertsArray {
    if (_expertsArray == nil) {
        _expertsArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _expertsArray;
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:URL_Discover parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSDictionary *dic = responseObject[@"discovery"];
                NSArray *tempArray = dic[@"topic_team"];
                NSArray *scrollArray = dic[@"ad"];
                
                _scrollArray = [KDTopicScroll objectArrayWithKeyValuesArray:scrollArray];
                _dataArray = [KDExpertTeam objectArrayWithKeyValuesArray:tempArray];

                dispatch_async(dispatch_get_main_queue(), ^{
                    [self initWithImageAndPageControl];
                    [self.tableView reloadData];
                });
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"error = %@",error);
            }];

        });
                    }
    return _dataArray;
}

- (void)initWithImageAndPageControl
{
    _scrollView = [[UIScrollView alloc] init];
    
    _scrollView.frame = CGRectMake(0, 0, 0, 180);
    
    _scrollView.contentSize = CGSizeMake(Width*self.scrollArray.count, 0);
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < self.scrollArray.count; i++) {
        @autoreleasepool {
            KDTopicScroll *topicImage = self.scrollArray[i];
            UIImageView * picImage = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, 200)];
            NSURL *url = [NSURL URLWithString:topicImage.fileurl];
            [picImage sd_setImageWithURL:url];
            picImage.tag = 100+i;
            [_scrollView addSubview:picImage];
        }
    }
   _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(Width/2.5, 130, 15*self.scrollArray.count, 50)];
    _pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _pageControl.numberOfPages = self.scrollArray.count;
    
    [self.tableView addSubview:_pageControl];
    
    [self.tableView bringSubviewToFront:_pageControl];
    
    [_pageControl addTarget:self action:@selector(didClickPageChange:) forControlEvents:UIControlEventValueChanged];
    [self addTimer];
    [_scrollView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didEnterListing:)]];
    
    self.tableView.tableHeaderView = _scrollView;
    
    [self.tableView addSubview:_pageControl];
    
    _scrollView.delegate = self;
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
    _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
//换到图片的下一张
- (void)nextImage
{
    int page = (int)_pageControl.currentPage;
    if (page == self.scrollArray.count - 1) {
        page=0;
    }else
    {
        page++;
    }
    //滚动scrollview
    CGFloat X=page *_scrollView.frame.size.width;
    _scrollView.contentOffset=CGPointMake(X, 0);
    
}
//移除定时器
- (void)removieTimer
{
    [_timer invalidate];
}
#pragma mark----------UIScrollViewDelegate
//结束滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scrollView) {
        int page = scrollView.contentOffset.x/Width;
        _pageControl.currentPage = page;
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
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
    
    KDExpertTeam *expertTeam = self.dataArray[indexPath.row];
    cell.topicName.text = expertTeam.title;
    cell.topicIntroduce.text = expertTeam.intro;
//    cell.comment.text = [NSString stringWithFormat:@"%lu",expertTeam.pri];
    cell.expertNumber.text = [NSString stringWithFormat:@"%lu",expertTeam.exp_count];
    cell.expertsArray = expertTeam.expert;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 155;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertTeamTableViewController *etTVC = [[KDExpertTeamTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:etTVC animated:YES];
}
@end
