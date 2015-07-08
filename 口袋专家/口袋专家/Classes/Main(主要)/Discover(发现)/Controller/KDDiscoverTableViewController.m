//
//  DiscoverTableViewController.m
//  PocketExperts
//
//  Created by 扶摇直上 on 15/6/4.
//  Copyright (c) 2015年 扶摇直上. All rights reserved.
//

#import "KDDiscoverTableViewController.h"
#import "KDExpertTeamTableViewController.h"
#import "KDBaseNavigationController.h"
#import "KDListingViewController.h"
#import "KDFirstTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "KDTopicScroll.h"
#import "AFNetworking.h"
#import "KDExpertTeam.h"
#import "KDExpertList.h"
#import "MJExtension.h"
#import "KDConst.h"
#import "KDDisTopic.h"
#import "KDSecondTableViewCell.h"
#import "KDHandle.h"
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
/** 存储专家话题的数组 */
@property(nonatomic,strong)NSMutableArray * expertArray;

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
    //self.tableView.showsVerticalScrollIndicator = NO;
}
#pragma mark - 懒加载
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

- (NSMutableArray *)expertArray
{
    if (_expertArray == nil) {
        _expertArray = [NSMutableArray array];
    }
    return _expertArray;
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
                NSArray * expertTopic = dic[@"topic"];
                
                _scrollArray = [KDTopicScroll objectArrayWithKeyValuesArray:scrollArray];
                NSArray * teamArray = [KDExpertTeam objectArrayWithKeyValuesArray:tempArray];
                NSArray * topicArray = [KDDisTopic objectArrayWithKeyValuesArray:expertTopic];
                [_dataArray addObject:teamArray];
                [_dataArray addObject:topicArray];
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
#pragma mark - 加载 scrollView 和 pageController
- (void)initWithImageAndPageControl
{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 64, 0, 180);
    _scrollView.contentSize = CGSizeMake(Width*self.scrollArray.count, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    /** 加载 scrollView 上的图片 */
    for (int i = 0; i < self.scrollArray.count; i++) {
        @autoreleasepool {
            KDTopicScroll *topicImage = self.scrollArray[i];
            UIImageView * picImage = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, 180)];
            [picImage sd_setImageWithURL:[NSURL URLWithString:topicImage.fileurl]];
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
#pragma mark - pageControl的点击事件
- (void)didClickPageChange:(UIPageControl *)pageControl
{
    NSLog(@"====");
}
#pragma mark-----------定时器
- (void)addTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
#pragma mark - 换到图片的下一张
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
#pragma mark - 移除定时器
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * arr = [self.dataArray objectAtIndex:section];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString * identifier = @"First";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDFirstTableViewCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDFirstTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        KDExpertTeam *expertTeam = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.topicName.text = expertTeam.title;
        cell.topicIntroduce.text = expertTeam.intro;
        cell.expertNumber.text = [NSString stringWithFormat:@"%lu",expertTeam.exp_count];
        cell.expertsArray = expertTeam.expert;
        return cell;

    }else{
        static NSString * identifier = @"second";
        BOOL nibResgistered = NO;
        if (!nibResgistered) {
            UINib * nib = [UINib nibWithNibName:NSStringFromClass([KDSecondTableViewCell class]) bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:identifier];
            nibResgistered = YES;
        }
        KDSecondTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        KDDisTopic *topic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        cell.expertTopic = topic;
        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 250;
    }else{
        return [KDHandle shareInstance].cellHeight;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    KDExpertTeamTableViewController *etTVC = [[KDExpertTeamTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:etTVC animated:YES];
}
@end
