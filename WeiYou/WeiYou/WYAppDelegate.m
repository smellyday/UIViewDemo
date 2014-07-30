//
//  WYAppDelegate.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYAppDelegate.h"
#import "WYGlobalState.h"
#import "WYDataEngine.h"
#import "consts.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "WYRecommendItineraryController.h"
#import "WYMyItineraryController.h"
#import "WYLoginController.h"

@implementation WYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	mlog(@"WYAppDelegate -- device system version is %f -- scale is %f", [[[UIDevice currentDevice] systemVersion] floatValue], [[UIScreen mainScreen] scale]);
    
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

    //init rootviewcontroller
	UITabBarController *rootController = [[UITabBarController alloc] init];
	[rootController.tabBar setBackgroundColor:[UIColor whiteColor]];
	rootController.delegate = self;
	
	WYRecommendItineraryController *ric = [[WYRecommendItineraryController alloc] init];
	UINavigationController *ricnav = [[UINavigationController alloc] initWithRootViewController:ric];
	[ricnav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
	
	UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"first tab item", @"first tab item") image:[UIImage imageNamed:PIC_FIRST_TAB_ITEM_N] selectedImage:[UIImage imageNamed:PIC_FIRST_TAB_ITEM_H]];
	ricnav.tabBarItem = firstItem;
	
	WYMyItineraryController *mic = [[WYMyItineraryController alloc] init];
	UINavigationController *micnav = [[UINavigationController alloc] initWithRootViewController:mic];
	[micnav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
	
	UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"second tab item", @"second tab item") image:[UIImage imageNamed:PIC_SECOND_TAB_ITEM_N] selectedImage:[UIImage imageNamed:PIC_SECOND_TAB_ITEM_H]];
	micnav.tabBarItem = secondItem;
	
	rootController.viewControllers = [NSArray arrayWithObjects:ricnav, micnav, nil];
	rootController.selectedIndex = 0;
	
	UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:rootController];
	rootNav.navigationBar.hidden = YES;
	[self.window setRootViewController:rootNav];
	
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
    LOGFUNCTION;
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
	LOGFUNCTION;
    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
        NSString *userid = [(WBAuthorizeResponse *)response userID];
        NSString *token = [(WBAuthorizeResponse *)response accessToken];
        if (token != nil && userid != nil) {
            [[[WYGlobalState sharedGlobalState] sinaUserInfo] setAuthToken:token];
            [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserID:userid];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_SINA_LOGIN object:nil userInfo:nil];
        }
    }
}

#pragma mark - tabbar delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
//	if (tabBarController.selectedIndex == 1 && ![[WYGlobalState sharedGlobalState] isLogin]) {
//		tabBarController.selectedIndex = 0;
//		WYLoginController *loginController = [[WYLoginController alloc] init];
//		UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:loginController];
//		[navc setNavigationBarHidden:YES];
//		[tabBarController presentViewController:navc animated:YES completion:nil];
//	}
}

@end
