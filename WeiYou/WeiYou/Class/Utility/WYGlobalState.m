//
//  WYGlobalState.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYGlobalState.h"
#import "consts.h"

@implementation WYGlobalState
@synthesize sinaUserInfo = _sinaUserInfo;
@synthesize qqUserInfo = _qqUserInfo;
@synthesize wyUserInfo = _wyUserInfo;

+ (id)sharedGlobalState {
	static WYGlobalState *sharedState = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedState = [[self alloc] init];
		sharedState.sinaUserInfo = [[WYSinaWeiboUserInfo alloc] init];
		sharedState.qqUserInfo = [[WYTencentUserInfo alloc] init];
		sharedState.wyUserInfo = [[WYUserInfo alloc] init];
	});
	
	return sharedState;
}

- (BOOL)isLogin {
    return [self.sinaUserInfo isLogin]||[self.qqUserInfo isLogin]||[self.wyUserInfo isLogin];
}

- (void)logout {
	[_sinaUserInfo logout];
}

@end
