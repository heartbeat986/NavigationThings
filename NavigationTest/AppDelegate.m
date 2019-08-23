//
//  AppDelegate.m
//  NavigationTest
//
//  Created by 林文龙 on 2019/8/23.
//  Copyright © 2019 中环互联. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "List/ListFirstViewController.h"
#import "discover/DisFirstViewController.h"
#import "My/MyFirstViewController.h"
#import "JXXNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    
   
    
    
    UITabBarController *tabVc = [[UITabBarController alloc] init];
    
    ViewController *vc1 = [[ViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    
    ListFirstViewController *vc2 = [[ListFirstViewController alloc] init];
    JXXNavigationViewController *nav2 = [[JXXNavigationViewController alloc] initWithRootViewController:vc2];
    
    DisFirstViewController *vc3 = [[DisFirstViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    
    MyFirstViewController *vc4 = [[MyFirstViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    [tabVc addChildViewController:nav1];
    [tabVc addChildViewController:nav2];
    [tabVc addChildViewController:nav3];
    [tabVc addChildViewController:nav4];
    
    window.rootViewController = tabVc;
    
    [self.window makeKeyWindow];
    
    return YES;
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
