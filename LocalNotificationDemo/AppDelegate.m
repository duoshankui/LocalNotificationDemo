//
//  AppDelegate.m
//  LocalNotificationDemo
//
//  Created by DoubleK on 2018/3/12.
//  Copyright © 2018年 DoubleK. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+PrevateMethod.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if (launchOptions != nil) {
        UILocalNotification *localNotification = [launchOptions objectForKey:@"UIApplicationLaunchOptionsLocalNotificationKey"];
        if (localNotification != nil) {
            NSInteger number = [[UIApplication sharedApplication] applicationIconBadgeNumber] - 1;
            [application setApplicationIconBadgeNumber:(number >= 0 ? number : 0)];
        }
    }
    
    [self registUserNotificationSettingForIOS8];
    
    return YES;
}

/**
 *  1.当app在前台时，若有通知，会调用此方法
 *  2.当应用程序在后台状态下，点击推送通知，程序从后台进入前台，会调用此方法（锁屏界面从后台进入前台也会执行此方法）
 *  3.当应用程序完全退出时不执行此方法
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"notification: %@",notification);
    UIApplicationState state = [UIApplication sharedApplication].applicationState;
    if (state == UIApplicationStateActive) {
        //前台
    }
    else if (state == UIApplicationStateInactive)  
    {
        NSInteger number = [[UIApplication sharedApplication] applicationIconBadgeNumber] - 1;
        [application setApplicationIconBadgeNumber:(number >= 0 ? number : 0)];
    }
    [application cancelLocalNotification:notification];
}


//监听附加操作按钮
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    NSLog(@"identifier:%@",identifier);
    completionHandler();
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler
{
    NSLog(@"identifier:%@ -- content : %@",identifier,responseInfo);
    completionHandler();
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
