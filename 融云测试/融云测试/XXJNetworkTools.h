//
//  XXJNetworkTools.h
//  ocAFN封装
//
//  Created by 许小军 on 2017/1/5.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface XXJNetworkTools : AFHTTPSessionManager
//定义 HTTP 请求枚举类型
typedef enum : NSUInteger{
    GET=0,
    POST=1
}XXJNetworkToolsType;

//单列方法
+(instancetype)shareTools;
//网络请求方法
-(void)request:(XXJNetworkToolsType)method URLString:(NSString *)URLString parameters:(id)parameters finished:(void(^)(id result,NSError * error))finished;
//取消请求方法
-(void)cancelRequest;

@end
