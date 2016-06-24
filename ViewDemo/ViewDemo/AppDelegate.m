//
//  AppDelegate.m
//  ViewDemo
//
//  Created by Terence on 16/6/23.
//  Copyright © 2016年 Terence. All rights reserved.
//

#import "AppDelegate.h"
#import "UDHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 1. 创建一个视图window. 获取设备屏幕大小，如果要做的比较通用，应该使用UIScreen获取尺寸大小
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2. 构建子控制器
    UDHomeViewController* vc = [[UDHomeViewController alloc] init];
    
    // 3. 构建成功的子控制器，设置给窗体的根控制器
    self.window.rootViewController = vc;
    
    // 4. 把window换成现在的HomeViewController了
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
