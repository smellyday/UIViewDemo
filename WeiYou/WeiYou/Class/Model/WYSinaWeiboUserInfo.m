//
//  WYSinaWeiboUserInfo.m
//  WeiYou
//
//  Created by zhangpan on 14-7-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSinaWeiboUserInfo.h"
#import "WYGlobalState.h"
#import "consts.h"

@implementation WYSinaWeiboUserInfo
@synthesize authToken = _authToken;
@synthesize userID = _userID;
@synthesize userName =_userName;
@synthesize userImageUrl = _userImageUrl;
@synthesize wyToken = _wyToken;


- (BOOL)isLogin {
    if (self.authToken != nil && [self.authToken length]!=0 && self.userID != nil && [self.userID length]!=0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)authToken {
    if (_authToken == nil) {
        _authToken = [[NSUserDefaults standardUserDefaults] objectForKey:SINA_USER_TOKEN];
    }
    
    return _authToken;
}

- (void)setAuthToken:(NSString *)authToken {
    _authToken = authToken;
    [[NSUserDefaults standardUserDefaults] setObject:_authToken forKey:SINA_USER_TOKEN];
}

- (NSString *)userID {
    if (_userID == nil) {
        _userID = [[NSUserDefaults standardUserDefaults] objectForKey:SINA_USER_ID];
    }
    
    return _userID;
}

- (void)setUserID:(NSString *)userID {
    _userID = userID;
    [[NSUserDefaults standardUserDefaults] setObject:_userID forKey:SINA_USER_ID];
}

- (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSUserDefaults standardUserDefaults] objectForKey:SINA_USER_NAME];
    }
    
    return _userName;
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:SINA_USER_NAME];
}

- (NSString *)userImageUrl {
    if (_userImageUrl == nil) {
        _userImageUrl = [[NSUserDefaults standardUserDefaults] objectForKey:SINA_USER_PROFILE_IMAGE_URL];
    }
    
    return _userImageUrl;
}

- (void)setUserImageUrl:(NSString *)userImageUrl {
    _userImageUrl = userImageUrl;
    [[NSUserDefaults standardUserDefaults] setObject:_userImageUrl forKey:SINA_USER_PROFILE_IMAGE_URL];
}

- (NSString *)wyToken {
    if (_authToken == nil) {
        _authToken = [[NSUserDefaults standardUserDefaults] objectForKey:SINA_USER_WY_TOKEN];
    }
    
    return _authToken;
}

- (void)setWyToken:(NSString *)authToken {
    _authToken = authToken;
    [[NSUserDefaults standardUserDefaults] setObject:_authToken forKey:SINA_USER_WY_TOKEN];
}

- (void)logout {
	self.authToken = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:SINA_USER_TOKEN];
    self.wyToken = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:SINA_USER_WY_TOKEN];
	self.userID = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:SINA_USER_ID];
	self.userName = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:SINA_USER_NAME];
	self.userImageUrl = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:SINA_USER_PROFILE_IMAGE_URL];
}

@end
