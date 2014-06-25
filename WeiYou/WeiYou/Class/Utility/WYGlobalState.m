//
//  WYGlobalState.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYGlobalState.h"

@implementation WYGlobalState
@synthesize boolLogin = _boolLogin;
@synthesize sinaWeibo = _sinaWeibo;

+ (id)sharedGlobalState {
	static WYGlobalState *sharedState = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedState = [[self alloc] init];
        sharedState.sinaWeibo = [[WYSinaWeibo alloc] init];
	});
	
	return sharedState;
}

@end
