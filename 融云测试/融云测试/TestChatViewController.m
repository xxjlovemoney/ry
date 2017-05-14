//
//  TestChatViewController.m
//  融云测试
//
//  Created by gagakj on 2017/5/13.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "TestChatViewController.h"

@interface TestChatViewController ()<RCIMUserInfoDataSource,RCIMGroupMemberDataSource>

@end

@implementation TestChatViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        //聊天类型
        //设置需要显示哪些类型的会话
        [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                            @(ConversationType_DISCUSSION),
                                            @(ConversationType_CHATROOM),
                                            @(ConversationType_GROUP),
                                            @(ConversationType_APPSERVICE),
                                            @(ConversationType_SYSTEM)]];
        
        //聚合会话  意思就是在会话列表上 显示有几种类型的会话，私聊，群聊，临时聊天等等，
        //设置需要将哪些类型的会话在会话列表中聚合显示
        //私聊
        [self setCollectionConversationType:@[@(ConversationType_PRIVATE)]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    
    
    [RCIM sharedRCIM].userInfoDataSource = self;
    [RCIM sharedRCIM].groupMemberDataSource = self;
}




-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion
{
    NSLog(@"Rong cloud userID: %@", userId);
    
//    RCUserInfo * user = [RCUserInfo alloc]initWithUserId:userId name:<#(NSString *)#> portrait:<#(NSString *)#>
    
}


/*!
 在会话列表中，收到新消息的回调
 @param notification    收到新消息的notification
 @discussion SDK在此方法中有针对消息接收有默认的处理（如刷新等），如果您重写此方法，请注意调用super。
 notification的object为RCMessage消息对象，userInfo为NSDictionary对象，其中key值为@"left"，value为还剩余未接收的消息数的NSNumber对象。
 */
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    [super didReceiveMessageNotification:notification];
    
    
    
}


/*!
 点击Cell头像的回调
 @param model   会话Cell的数据模型
 */
- (void)didTapCellPortrait:(RCConversationModel *)model {
}
/*!
 长按Cell头像的回调
 @param model   会话Cell的数据模型
 */
- (void)didLongPressCellPortrait:(RCConversationModel *)model {
    
    
    
    
}


/*!
 点击会话列表中Cell的回调
 @param conversationModelType   当前点击的会话的Model类型
 @param model                   当前点击的会话的Model
 @param indexPath               当前会话在列表数据源中的索引值
 @discussion 您需要重写此点击事件，跳转到指定会话的聊天界面。
 如果点击聚合Cell进入具体的子会话列表，在跳转时，需要将isEnteredToCollectionViewController设置为YES。
 */
//- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
//         conversationModel:(RCConversationModel *)model
//               atIndexPath:(NSIndexPath *)indexPath {
//    ConversationVC *conversationVC = [[ConversationVC alloc] init];
//    conversationVC.conversationType = model.conversationType;
//    conversationVC.targetId = model.targetId;
//    conversationVC.navigationItem.title = model.conversationTitle;
//    [self.navigationController pushViewController:conversationVC animated:YES]; // 进入聊天界面了
//    [self.conversationListTableView cellForRowAtIndexPath:indexPath].selected = NO;
//}


//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"想显示的会话标题";
    [self.navigationController pushViewController:conversationVC animated:YES];
}




















@end
