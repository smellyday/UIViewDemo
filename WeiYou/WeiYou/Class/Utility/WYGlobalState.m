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

- (BOOL)ifUserLogIn {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_TOKEN_SINA];
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_ID];
    if (token != nil && uid != nil) {
        return YES;
    }
    return NO;
}

@end
