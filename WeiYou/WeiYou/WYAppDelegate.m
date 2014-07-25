//
//  WYAppDelegate.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYAppDelegate.h"
#import "WYRootViewController.h"
#import "WYGlobalState.h"
#import "WYDataEngine.h"
#import "consts.h"
#import <TencentOpenAPI/TencentOAuth.h>
#include <stdio.h>

@implementation WYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	mlog(@"WYAppDelegate -- device system version is %f --", [[[UIDevice currentDevice] systemVersion] floatValue]);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
    //iOS7 OR the version before
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
		[application setStatusBarStyle:UIStatusBarStyleLightContent];
		
		self.window.clipsToBounds = YES;
	}
    
    // synchronization of trips.
    [[WYDataEngine sharedDataEngine] loadTripsFromLocal];
//    [[WYDataEngine sharedDataEngine] performSelector:@selector(bisynchronizeTrips) withObject:nil afterDelay:0];
    
    // sina weibo
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:SinaWeiboAppKey];
    
//    if ([[WYGlobalState sharedGlobalState] isLogin]) {
//        [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserName:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_NAME]];
//        [[[WYGlobalState sharedGlobalState] sinaWeiboInfo] setUserID:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_ID]];
//        [[[WYGlobalState sharedGlobalState] sinaWeiboInfo] setUserImageUrl:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_PROFILE_IMAGE_URL]];
//        [[[WYGlobalState sharedGlobalState] sinaWeiboInfo] setUserImage:[UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_PROFILE_IMAGE_DATA]]];
//        [[[WYGlobalState sharedGlobalState] sinaWeiboInfo] setAuthToken:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_TOKEN_SINA]];
//    }
	
    //init rootviewcontroller
	WYRootViewController *rootViewController = [[WYRootViewController alloc] init];
	UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    [rootNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
	[self.window setRootViewController:rootNavigationController];
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	 
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    mlog(@"%s", __func__);
    mlog(@"url : %@", [url description]);
    mlog(@"source application : %@", sourceApplication);
    if ([[url description] hasPrefix:PREFIX_QQ]) {
        return [TencentOAuth HandleOpenURL:url];
    } else if ([[url description] hasPrefix:PREFIX_SINA]) {
        return [WeiboSDK handleOpenURL:url delegate:self];
    }
    
    return NO;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [TencentOAuth HandleOpenURL:url];
}

#pragma mark - sina weibo delegate.
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {

}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        mlog(@"SinaSDK -- response is WBAuthorizeResponse.");
        
        NSString *userid = [(WBAuthorizeResponse *)response userID];
        NSString *token = [(WBAuthorizeResponse *)response accessToken];
        
        if (token != nil) {
            
            [[[WYGlobalState sharedGlobalState] sinaUserInfo] setAuthToken:token];
            [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserID:userid];
            [[NSNotificationCenter defaultCenter] postNotificationName:WY_NOTI_SINA_LOGIN object:nil userInfo:nil];
            
        }
        
    }
    
    mlog(@"user info : %@", [response.userInfo description]);
}

#pragma mark - Tencent session delegate.

@end
