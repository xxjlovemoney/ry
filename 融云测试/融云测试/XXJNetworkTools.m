//
//  XXJNetworkTools.m
//  ocAFN封装
//
//  Created by 许小军 on 2017/1/5.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import "XXJNetworkTools.h"

@implementation XXJNetworkTools
+(instancetype)shareTools
{
    static XXJNetworkTools * instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XXJNetworkTools alloc]init];
        
        //        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain",@"text/html", nil];
        //更改解析方式
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        //设置对证书的处理方式
        instance.securityPolicy.allowInvalidCertificates = YES;
        instance.securityPolicy.validatesDomainName = NO;
        
    });
    
    return instance;

}


//简历网络请求方法
-(void)request:(XXJNetworkToolsType)method URLString:(NSString *)URLString parameters:(id)parameters finished:(void(^)(id result,NSError * error))finished
{
    if (method ==GET) {
        [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            finished(nil,error);
        }];
    }else{
        [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject,nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil,error);
        }];
    }
    
}

//取消请求
-(void)cancelRequest
{
    [self.tasks makeObjectsPerformSelector:@selector(cancel)];
}


@end
