//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by DoubleK on 2018/3/12.
//  Copyright © 2018年 DoubleK. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)postNoticaion:(id)sender {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = @"Hello,你好啊 - alertBody + fireDate";
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];  //5秒后
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.2) {
        localNotification.alertTitle = @"推送通知提醒标题 + alertTitle";
    }
    
    //锁屏时在推送消息的最下方显示设置的提示字符串
    localNotification.alertAction = @"点击查看消息";
    
    //name of resource in app's bundle to play or UILocalNotificationDefaultSoundName
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    //传递自定义参数
    localNotification.userInfo = @{@"Type" : @"1"};
    
    //重复间隔：类似于定时器，每隔一段时间就发送通知
    localNotification.repeatInterval = NSCalendarUnitDay;
    
    localNotification.category = @"choose";
    
    //发送
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSInteger applicationBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:applicationBadgeNumber];
    
    
//    UNNotificationRequest *request =
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
