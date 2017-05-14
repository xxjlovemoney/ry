//
//  ChatDetailViewController.m
//  融云测试
//
//  Created by 许小军 on 2017/5/14.
//  Copyright © 2017年 gagakj. All rights reserved.
//

#import "ChatDetailViewController.h"

@interface ChatDetailViewController ()

@end

@implementation ChatDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置聊天界面背景
    self.conversationMessageCollectionView.backgroundColor = [UIColor clearColor];
    //设置背景图
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    self.chatSessionInputBarControl.switchButton.hidden = YES;
}
    
/*!
 即将显示消息Cell的回调
 
 @param cell        消息Cell
 @param indexPath   该Cell对应的消息Cell数据模型在数据源中的索引值
 
 @discussion 您可以在此回调中修改Cell的显示和某些属性。
 */
- (void)willDisplayMessageCell:(RCMessageBaseCell *)cell
                   atIndexPath:(NSIndexPath *)indexPath
{
    //比如修改文本消息的字体颜色，需要先判断
    if ([cell isMemberOfClass:[RCTextMessageCell class]]) {
        //现在方法中的cell的类型是RCMessageBaseCell，里面没有修改的这些属性，所以需要转换，
        RCTextMessageCell * textCell = (RCTextMessageCell *)cell;
        //转换后cell里面的lable是融云自己封装的lable，所以再转换一下
        UILabel * textMsgLable = (UILabel *)textCell.textLabel;
        textMsgLable.textColor = [UIColor redColor];
  
    }

}




@end
