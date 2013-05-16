//
//  HLAppDelegate.m
//  Live_Healthy
//
//  Created by Milton D. Mitjans on 4/9/13.
//  Copyright (c) 2013 Milton D. Mitjans. All rights reserved.
//

#import "HLAppDelegate.h"
#import "HLPlansViewController.h"
#import "HLPlan.h"

#import <Parse/Parse.h>

@implementation HLAppDelegate {
    NSMutableArray* plans;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [Parse setApplicationId:@"Ps3Z5KuhwrExyxK5P2JxwIVa0gf42obU1UnUv6rN"
                  clientKey:@"d0oDmDkFt8x5LqhtAlHUS8zNzNk1yE7T2IRrg3LA"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
    // Override point for customization after application launch.
    
    UITabBarController *tabBarController = (UITabBarController *) self.window.rootViewController;
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:1];
    
    HLPlan* plan = [[HLPlan alloc] init];
    
    plan.planName = @"Test";
    
    plans = [NSMutableArray arrayWithCapacity:10];
    
    [plans addObject:plan];

    HLPlansViewController *plansViewController = [[navigationController viewControllers] objectAtIndex:0];
    
    plansViewController.plans = plans;
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if (!url) {  return NO; }
    
    NSString *URLString = [url absoluteString];
    [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:@"url"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
