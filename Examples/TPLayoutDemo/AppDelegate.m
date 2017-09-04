//
//  AppDelegate.m
//  TPKitDemo
//
//  Created by weihuafeng on 2017/6/30.
//  Copyright © 2017年 tpkit. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *mainVC = [[MainViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
