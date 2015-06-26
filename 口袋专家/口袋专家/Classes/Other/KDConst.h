#import <Foundation/Foundation.h>

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

#define ScreenW self.view.frame.size.width
#define ScreenH self.view.frame.size.height
#define Width [[UIScreen mainScreen] bounds].size.width
#define URL_Str @"http://192.168.2.36:5000/api/v1.0/discovery/list"
