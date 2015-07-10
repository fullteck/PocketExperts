#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MJExtension.h"



#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define KDLog(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define KDLog(...)
#endif

/**
 * 打印所有的属性
 */
#define KDLogAllIvars \
-(NSString *)description \
{ \
return [self keyValues].description; \
}

/** 字典里一些替换的字符串 */
#define INV @"inv"
#define INVTOPIC @"invtopic"

#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
#define Width [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height
#define ViewW self.frame.size.width
#define ViewH self.frame.size.height

#define BGColor [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1]
/** 发现首页 */
#define URL_Discover @"http://182.254.221.13:8080/api/v1.0/discovery/list"
/** 清单页面 */
#define URL_List @"http://182.254.221.13:8080/api/v1.0/discovery/Inventory/9"
/** 专家列表 */
#define kNetRequestUrl @"http://182.254.221.13:8080/api/v1.0/expert/list/0.0/32.3213213" 
/** 专家话题详情 */
#define kTopicDetail @"http://182.254.221.13:8080/api/v1.0/topic/info/50"
/** 专家评论列表 */
#define kCommentList @"http://182.254.221.13:8080/api/v1.0/comment/list/26/1"
/** 我的预约 */
#define kMyReserve @"http://182.254.221.13:8080/api/v1.0/appointment/list/1"
