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
@synthesize account = _account;
@synthesize userImage = _userImage;
@synthesize userName = _userName;
@synthesize userImageUrl = _userImageUrl;

+ (id)sharedGlobalState {
	static WYGlobalState *sharedState = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedState = [[self alloc] init];
		sharedState.sinaUserInfo = [[WYSinaWeiboUserInfo alloc] init];
		sharedState.qqUserInfo = [[WYTencentUserInfo alloc] init];
		sharedState.wyUserInfo = [[WYUserInfo alloc] init];
		sharedState.account = [[NSNumber alloc] init];
	});
	
	return sharedState;
}

- (NSNumber *)account {
	if (_account == nil) {
		_account = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_ACCOUNT];
	}
	return _account;
}

- (NSString *)userName {
	if (_userName == nil) {
		_userName = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_USER_NAME];
	}
	
	return _userName;
}

- (NSString *)userImageUrl {
	if (_userImageUrl == nil) {
		_userImageUrl = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_USER_PROFILE_IMAGE_URL];
	}
	
	return _userImageUrl;
}

- (UIImage *)userImage {
	if (_userImage == nil) {
		_userImage = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_USER_PROFILE_IMAGE];
	}
	
	return _userImage;
}

- (BOOL)isLogin {
	
	BOOL sinabool = [_sinaUserInfo isLogin];
	BOOL qqbool = [_qqUserInfo isLogin];
	BOOL wybool = [_wyUserInfo isLogin];
	
	if (sinabool) {
		[[WYGlobalState sharedGlobalState] setAccount:[NSNumber numberWithInteger:SinaAccount]];
	} else if (qqbool) {
		[[WYGlobalState sharedGlobalState] setAccount:[NSNumber numberWithInteger:TencentAccount]];
	} else {
		[[WYGlobalState sharedGlobalState] setAccount:[NSNumber numberWithInteger:WYAccount]];
	}
	
    return sinabool||qqbool||wybool;
}

- (void)logout {
	[_sinaUserInfo logout];
	[_qqUserInfo logout];
	[_wyUserInfo logout];
	
	self.account = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:GLOBAL_ACCOUNT];
	self.userName = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:GLOBAL_USER_NAME];
	self.userImageUrl = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:GLOBAL_USER_PROFILE_IMAGE_URL];
	self.userImage = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:GLOBAL_USER_PROFILE_IMAGE];
}

@end
