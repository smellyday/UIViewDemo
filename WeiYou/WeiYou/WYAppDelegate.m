//
//  WYAppDelegate.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYAppDelegate.h"
#import "WYRootViewController.h"
#import "consts.h"
#include <stdio.h>
#import "WYGlobalState.h"
#import "WYDataEngine.h"

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
	
    //init rootviewcontroller
	WYRootViewController *rootViewController = [[WYRootViewController alloc] init];
	UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	rootNavigationController.navigationBar.barTintColor = WY_MAIN_COLOR;
	rootNavigationController.navigationBar.tintColor = [UIColor blackColor];
	[self.window setRootViewController:rootNavigationController];
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    // synchronization of trips.
    [[WYDataEngine sharedDataEngine] performSelector:@selector(bisynchronizeTrips) withObject:nil afterDelay:0];
    
    // sina weibo
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:SinaWeiboAppKey];
    
    if ([[WYGlobalState sharedGlobalState] ifUserLogIn]) {
        [[[WYGlobalState sharedGlobalState] sinaWeibo] setUserName:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_NAME]];
        [[[WYGlobalState sharedGlobalState] sinaWeibo] setUserID:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_ID]];
        [[[WYGlobalState sharedGlobalState] sinaWeibo] setUserImageUrl:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_PROFILE_IMAGE_URL]];
        [[[WYGlobalState sharedGlobalState] sinaWeibo] setUserImage:[UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_PROFILE_IMAGE_DATA]]];
        [[[WYGlobalState sharedGlobalState] sinaWeibo] setAuthToken:[[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_TOKEN_SINA]];
    }
    
	/*
		//test begin----
	static int mst = 10;
	int b = 10;
	int *a = &b;
	__block char mychar;
	void (^Mblock)(int) = ^(int bb) {
		*a = bb + 10;
		mst = 29;
		minteger = 90;
		mychar = 'a';
		printf("my char is %c, my a is %d\n", mychar, *a);
	};
	
	mychar = 'b';
	Mblock(5);
	
	*a = 20;
	Mblock(5);

		//test end------
	 */
	
	/*
	NSData *tmp1 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tamp1@2x" ofType:@"png"]];
	NSData *tmp2 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tamp2@2x" ofType:@"png"]];
	
	NSLog(@"%@", [tmp1 description]);
	NSLog(@"\n\n");
	NSLog(@"%@", [tmp2 description]);
	*/
	 
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
    return [WeiboSDK handleOpenURL:url delegate:self];
}

#pragma sina weibo delegate.
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {

}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        NSLog(@"SinaSDK -- response is WBAuthorizeResponse.");
        
        NSString *userid = [(WBAuthorizeResponse *)response userID];
        NSString *token = [(WBAuthorizeResponse *)response accessToken];
        
        if (token != nil) {
            
            [[[WYGlobalState sharedGlobalState] sinaWeibo] setAuthToken:token];
            [[[WYGlobalState sharedGlobalState] sinaWeibo] setUserID:userid];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:WY_USER_TOKEN_SINA];
            [[NSUserDefaults standardUserDefaults] setObject:userid forKey:WY_USER_ID];
            [[NSNotificationCenter defaultCenter] postNotificationName:WY_NOTI_SINA_LOGIN object:nil userInfo:nil];
            
        }
        
    }
    
    NSLog(@"user info : %@", [response.userInfo description]);
}

@end
