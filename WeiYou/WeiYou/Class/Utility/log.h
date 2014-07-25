//
//  log.h
//  WeiYou
//
//  Created by zhangpan on 14-7-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#ifndef WeiYou_log_h
#define WeiYou_log_h

// log swicher.
#define LOGOPEN

#ifdef LOGOPEN
#define DEBUG_LOG
#define SHOW_FUNCTION
#define VC_LOGOPEN
#define NET_BLOCK_LOG
#define VIEW_BLOCK_LOG
#else
#endif


#ifdef DEBUG_LOG
#define mlog(...) NSLog(__VA_ARGS__)
#else
#define mlog(...)
#endif

#ifdef SHOW_FUNCTION
#define LOGFUNCTION NSLog(@"%s", __func__)
#else
#define LOGFUNCTION
#endif

//---
#define LogFrame(frame) NSLog(@"frame[X=%.1f,Y=%.1f,W=%.1f,H=%.1f",frame.origin.x,frame.origin.y,frame.size.width,frame.size.height)
#define LogPoint(point) NSLog(@"Point[X=%.1f,Y=%.1f]",point.x,point.y)

#ifdef LOGOPEN
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

//networking log
#ifdef NET_BLOCK_LOG
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



#endif
