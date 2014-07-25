//
//  consts_utility.h
//  WeiYou
//
//  Created by owen on 7/24/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#ifndef WeiYou_consts_utility_h
#define WeiYou_consts_utility_h


#pragma mark --time setup


#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#endif

#ifdef	_DEBUG
#define	DNSLog(...);	NSLog(__VA_ARGS__);
#define DNSLogMethod	NSLog(@"[%s] %@", class_getName([self class]), NSStringFromSelector(_cmd));
#define DNSLogPoint(p)	NSLog(@"%f,%f", p.x, p.y);
#define DNSLogSize(p)	NSLog(@"%f,%f", p.width, p.height);
#define DNSLogRect(p)	NSLog(@"%f,%f %f,%f", p.origin.x, p.origin.y, p.size.width, p.size.height);

CFAbsoluteTime startTime;
#define D_START			startTime=CFAbsoluteTimeGetCurrent();
#define D_END			DNSLog(@"[%s] %@ %f seconds", class_getName([self class]), NSStringFromSelector(_cmd), CFAbsoluteTimeGetCurrent() - startTime );
#else
#define DNSLog(...);	// NSLog(__VA_ARGS__);
#define DNSLogMethod	// NSLog(@"[%s] %@", class_getName([self class]), NSStringFromSelector(_cmd) );
#define DNSLogPoint(p)	// NSLog(@"%f,%f", p.x, p.y);
#define DNSLogSize(p)	// NSLog(@"%f,%f", p.width, p.height);
#define DNSLogRect(p)	// NSLog(@"%f,%f %f,%f", p.origin.x, p.origin.y, p.size.width, p.size.height);

#define D_START			// CFAbsoluteTime startTime=CFAbsoluteTimeGetCurrent();
#define D_END			// DNSLog(@"New %f seconds", CFAbsoluteTimeGetCurrent() - startTime );
#endif

#define SAFE_FREE(p) { if(p) { free(p); (p)=NULL; } }

#pragma mark ---- AppDelegate
	//AppDelegate
#define APPDELEGATE [(AppDelegate*)[UIApplication sharedApplication]  delegate]
	//UIApplication
#define APPD  [UIApplication sharedApplication]
#define rootNavVC (UINavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController]

#define isPad  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define isiPhone5 ([[UIScreen mainScreen]bounds].size.height == 568)



#pragma mark ---- String  functions
#define EMPTY_STRING        @""
#define STR(key)            NSLocalizedString(key, nil)


#pragma mark ---- UIImage  UIImageView  functions
#define IMG(name) [UIImage imageNamed:name]
#define IMGF(name) [UIImage imageNamedFixed:name]

#pragma mark ---- File  functions
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]



#endif
