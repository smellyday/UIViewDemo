	//
	//  WYLog.h
	//  WeiYou
	//
	//  Created by owen on 11/18/13.
	//  Copyright (c) 2013 xyn. All rights reserved.
	//

#define weiyou
#define analyselog


#ifdef weiyou
#define wylog NSLog(@"%s", __func__)
#else
#define wylog
#endif


#ifdef analyselog
#define mlog(...) NSLog(__VA_ARGS__)
#else
#define mlog(...)
#endif