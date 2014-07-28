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

+ (id)sharedGlobalState {
	static WYGlobalState *sharedState = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedState = [[self alloc] init];
	});
	
	return sharedState;
}

- (WYSinaWeiboUserInfo *)sinaAuthInfo {
    if (!_sinaUserInfo) {
        _sinaUserInfo = [[WYSinaWeiboUserInfo alloc] init];
    }
    return _sinaUserInfo;
}

- (WYTencentUserInfo *)qqAuthInfo {
    if (!_qqUserInfo) {
        _qqUserInfo = [[WYTencentUserInfo alloc] init];
    }
    return _qqUserInfo;
}

- (BOOL)isLogin {
    return NO;
}


@end
