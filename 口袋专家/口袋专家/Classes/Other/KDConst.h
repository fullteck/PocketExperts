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

/** 发现首页 */
#define URL_Discover @"http://182.254.221.13:8080/api/v1.0/discovery/list"
/** 清单页面 */
#define URL_List @"http://182.254.221.13:8080/api/v1.0/discovery/Inventory/9"
/** 专家列表 */
#define kNetRequestUrl @"http://182.254.221.13:8080/api/v1.0/expert/list/0.0/32.3213213" 
/** 专家评论 */
#define kNetUrl @"http://192.168.2.36:5000/api/v1.0/topic/info/50"
