//
//  consts_utility.h
//  WeiYou
//
//  Created by owen on 7/24/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#ifndef WeiYou_consts_utility_h
#define WeiYou_consts_utility_h

#define LOGOPEN 1
#define VC_LOGOPEN 1
#define DB_BLOCK_LOG
#define NET_BLOCK_LOG 1


#pragma mark ---log  flag

#define LogFrame(frame) NSLog(@"frame[X=%.1f,Y=%.1f,W=%.1f,H=%.1f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)
#define LogPoint(point) NSLog(@"Point[X=%.1f,Y=%.1f]",point.x,point.y)

#if LOGOPEN
#define DDDLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define DDDLog(FORMAT, ...)
#endif

	//viewController log
#ifdef VC_LOGOPEN
#define LogVC DDDLog
#else
#define LogVC
#endif

	//dbbase log
#ifdef DB_BLOCK_LOG
#define LogDB DDDLog
#else
#define LogDB
#endif


	//networking log
#if NET_BLOCK_LOG
#define LogNET DDDLog
#else
#define LogNET
#endif

	//view log
#ifdef VIEW_BLOCK_LOG
#define LogVIEW DDDLog
#else
#define LogVIEW
#endif


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
