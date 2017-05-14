//
//  ViewController.m
//  融云测试
//
//  Created by gagakj on 2017/5/13.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "NSString+Hash.h"

#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
#import "TestChatViewController.h"


#import "ChatDetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //注册appkey
//    [[RCIM sharedRCIM] initWithAppKey:@"vnroth0kvf58o"];
//    //链接融云服务器
//    [[RCIM sharedRCIM] connectWithToken:@"koAODcNiZSZKIMi6PleUOiMlqCmvXRyfL89ONnJYgPf+GXTyzQJ9u/PWYb1OhwLFmnoLv16ZSGYswOQRlnrmdCmNh28leasW" success:^(NSString *userId) {
//        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
//    } error:^(RCConnectErrorCode status) {
//        NSLog(@"登陆的错误码为:%ld", (long)status);
//    } tokenIncorrect:^{
//        //token过期或者不正确。
//        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
//        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
//        NSLog(@"token错误");
//    }];
    
    
    
}

- (IBAction)getInChatList:(UIButton *)sender {
    TestChatViewController * chatList = [[TestChatViewController alloc]init];
    chatList.title = @"我擦聊天";
    [self.navigationController pushViewController:chatList animated:YES];
    
    
//    RCDCustomerServiceViewController *chatService = [[RCDCustomerServiceViewController alloc] init];
//#define SERVICE_ID @"您在融云后台开通的客服ID"
//    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
//    chatService.targetId = SERVICE_ID;
//    chatService.title = @"客服";
////    chatService.csInfo = csInfo; //用户的详细信息，此数据用于上传用户信息到客服后台，数据的nickName和portraitUrl必须填写。(目前该字段暂时没用到，客服后台显示的用户信息是你获取token时传的参数，之后会用到）
//    [self.navigationController pushViewController :chatService animated:YES];
}

//进入聊天界面
- (IBAction)getInDetailView:(id)sender {
    //    //sdk中的聊天界面 RCConversationViewController
    //    RCConversationViewController * rccV = [[RCConversationViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"eFGocwuDF"];
    //    rccV.title = @"eFGocwuDF聊天";
    //    //因为是与同一个人聊天，所以进入的界面是一样的
    //    [self.navigationController pushViewController:rccV animated:YES];
    
    
    //如果没有会话界面，或者自定义聊天界面，如何跳转
    //使用集成的类，进行跳转
    ChatDetailViewController * detail = [[ChatDetailViewController alloc]initWithConversationType:ConversationType_PRIVATE targetId:@"eFGocwuDF"];
    detail.title = @"集成eFGocwuDF聊天";
    [self.navigationController pushViewController:detail animated:YES];
    
    
    
    
}




















-(void)getToken
{
    /*
     POST /user/getToken.json HTTP/1.1
     Host: api.cn.ronghub.com
     App-Key: vnroth0kvf58o
     Nonce: 14314  NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
     Timestamp: 1408706337 [[NSString alloc] initWithFormat:@"%ld",(NSInteger)[NSDate timeIntervalSinceReferenceDate]];
     Signature: 890b422b75c1c5cb706e4f7921df1d94e69c17f4   NSString *sha1 = [self sha1:[NSString stringWithFormat:@"%@%@%@",appSec,nonce,timestamp]];
     
     
     Content-Type: application/x-www-form-urlencoded
     Content-Length: 78
     
     userId=jlk456j5&name=Ironman&portraitUri=http%3A%2F%2Fabc.com%2Fmyportrait.jpg
     */
    
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    NSString *urlstr =@"https://api.cn.rong.io/user/getToken.json";
    //    NSDictionary *dic =@{@"userId":@"填入想申请token的userId",
    //                         @"name":@"填入名字",
    //                         @"portraitUri":@"填入一个网络图片的Url"
    //                         };
    //
    //    NSString * timestamp = [[NSString alloc] initWithFormat:@"%ld",(NSInteger)[NSDate timeIntervalSinceReferenceDate]];
    //    NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
    //    NSString * appkey = @"填写你申请的apply";
    //    NSString * Signature = [[NSString stringWithFormat:@"%@%@%@",appkey,nonce,timestamp] sha1String];//用sha1对签名进行加密,随你用什么方法,MD5...
    //    //以下拼接请求内容
    //    [manager.requestSerializer setValue:appkey forHTTPHeaderField:@"App-Key"];
    //    [manager.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
    //    [manager.requestSerializer setValue:timestamp forHTTPHeaderField:@"Timestamp"];
    //    [manager.requestSerializer setValue:Signature forHTTPHeaderField:@"Signature"];
    //    [manager.requestSerializer setValue:@"填入你申请的appSecret" forHTTPHeaderField:@"appSecret"];
    //    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //    //开始请求
    //    [manager POST:urlstr parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //        //这里你就能得到token啦~
    //        NSLog(@"%@  %@", responseObject);
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //
    //    }];
    
    
    NSString *urlstr =@"https://api.cn.rong.io/user/getToken.json";
    
    NSDictionary *dic =@{@"userId":@"xxjloveduoduo",
                         @"name":@"duoduo",
                         @"portraitUri":@"http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg"
                         };

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    NSString * timestamp = [[NSString alloc] initWithFormat:@"%ld",(NSInteger)[NSDate timeIntervalSinceReferenceDate]];
    NSString * nonce = [NSString stringWithFormat:@"%d",arc4random()];
    NSString * appkey = @"vnroth0kvf58o";
    NSString * Signature = [[NSString stringWithFormat:@"%@%@%@",appkey,nonce,timestamp] md5String];
    //以下拼接请求内容
    [manager.requestSerializer setValue:appkey forHTTPHeaderField:@"App-Key"];
    [manager.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
    [manager.requestSerializer setValue:timestamp forHTTPHeaderField:@"Timestamp"];
    [manager.requestSerializer setValue:Signature forHTTPHeaderField:@"Signature"];
    [manager.requestSerializer setValue:@"xa5V9uBP6Ct" forHTTPHeaderField:@"appSecret"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:urlstr parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

    
}


@end
