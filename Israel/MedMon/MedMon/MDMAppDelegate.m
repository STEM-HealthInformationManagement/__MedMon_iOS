//
//  MDMAppDelegate.m
//  MedMon
//
//  Created by Saurabh Rathod on 7/21/14.
//  Copyright (c) 2014 Health Information Management. All rights reserved.
//

#import "MDMAppDelegate.h"

@implementation MDMAppDelegate
@synthesize backgroundActive = _backgroundActive;
@synthesize window = _window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    //[window addSubview:[myViewController view]];
    
    //self.window.rootViewController = myViewController;
    
    //[self.window makeKeyAndVisible];
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  
    backgroundActive = TRUE;
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}



- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    [notification setAlertAction:@"Israel's Alert"];
    [notification setAlertBody:@"Time to take medicine!"];
    
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:self.TimeRemaining]];
    
 
     [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
   //[notification setApplicationIconBadgeNumber:nil];
    backgroundActive= YES;
    
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
