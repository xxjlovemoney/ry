//
//  AppDelegate.m
//  融云测试
//
//  Created by gagakj on 2017/5/13.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "AppDelegate.h"

#define RONGCLOUD_IM_APPKEY @"vnroth0kvf58o"

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化融云SDK。
    [[RCIM sharedRCIM] initWithAppKey:RONGCLOUD_IM_APPKEY];
    //从本地获取token
    NSString *token = @"koAODcNiZSZKIMi6PleUOiMlqCmvXRyfL89ONnJYgPf+GXTyzQJ9u/PWYb1OhwLFmnoLv16ZSGYswOQRlnrmdCmNh28leasW";
    
    //判断是否存在token连接融云
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
//            [[RCIM sharedRCIM]setUserInfoDataSource:self];
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"login error status: %ld.", (long)status);
    } tokenIncorrect:^{
         NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
    }];
    
    
    [RCIM sharedRCIM].userInfoDataSource = self;
    
    return YES;
}


//RCIMUserInfoDataSource
//设置会话列表中会话者的头像 ID 昵称。。。。。。
-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion
{
    NSLog(@"Rong cloud userID: %@", userId);
    
    //    RCUserInfo * user = [RCUserInfo alloc]initWithUserId:userId name:<#(NSString *)#> portrait:<#(NSString *)#>
    
    if ([userId isEqualToString:@"eFGocwuDF"]) {
        RCUserInfo * userInfo = [[RCUserInfo alloc]init];
        userInfo.userId = userId;
        userInfo.name = @"谁谁谁";
        // 用户头像的URL
        userInfo.portraitUri =@"https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=蝴蝶犬&hs=2&pn=0&spn=0&di=88252466610&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=4219156814%2C1719345746&os=356916648%2C344274438&simid=3341765261%2C273291912&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=蝴蝶犬&objurl=http%3A%2F%2Fi.zeze.com%2Fattachment%2Fforum%2F201602%2F08%2F192612o4i86umei8szod3m.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bzjzj_z%26e3Bv54AzdH3Fpi6jw1-8cm0dn8-8-8_z%26e3Bip4s&gsm=0";
        return completion(userInfo);
    }
    return completion(nil);
    
    
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
