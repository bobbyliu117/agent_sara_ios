//
//  AppDelegate.m
//  agent-sara
//
//  Created by Chang Liu on 2/23/20.
//  Copyright © 2020 Chang Liu. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
@import Firebase;

@interface AppDelegate ()
@property (nonatomic, strong) UIWindow *myWindow;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    UIWindow *window = UIWindow.new;
    window.backgroundColor = UIColor.whiteColor;
    self.myWindow = window;
    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:MenuViewController.new];
    [window makeKeyAndVisible];
    
    return YES;
}


@end
