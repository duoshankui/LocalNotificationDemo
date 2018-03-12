//
//  AppDelegate+PrevateMethod.m
//  LocalNotificationDemo
//
//  Created by DoubleK on 2018/3/12.
//  Copyright © 2018年 DoubleK. All rights reserved.
//

#import "AppDelegate+PrevateMethod.h"

@implementation AppDelegate (PrevateMethod)

- (void)registUserNotificationSettingForIOS8
{
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        //categories:推送消息的附加操作，可为nil。如果不为空，可以在推送消息的后面增加几个按钮（如同意，同意；类似于今日头条的不感兴趣，收藏，打开）
        
        UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
        category.identifier = @"choose";
        
        //同意
        UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
        action1.identifier = @"yes";
        action1.title = @"同意";
        action1.activationMode = UIUserNotificationActivationModeForeground; //点击按钮进入前台
        action1.authenticationRequired = true;
        action1.destructive = false;
        
        //不同意
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
        action2.identifier = @"no";
        action2.title = @"不同意";
        action2.activationMode = UIUserNotificationActivationModeBackground; //后台模式，点击了就完了
        action2.authenticationRequired = true;
        action2.destructive = true;
        
        if (@available(iOS 9.0, *)) {
            action2.behavior = UIUserNotificationActionBehaviorTextInput;
            action2.parameters = @{UIUserNotificationTextInputActionButtonTitleKey : @"拒绝原因"};
        } else {
            // Fallback on earlier versions
        }
        
        [category setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
        
        NSSet<UIUserNotificationCategory *> *categories = [NSSet setWithObjects:category, nil];

        UIUserNotificationType type = UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert;
        
//        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
            UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:type categories:categories];
        [[UIApplication sharedApplication] registerUserNotificationSettings:setting];

    }
}

@end
