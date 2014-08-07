//
//  WYUserInfo.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserInfo.h"
#import "WYGlobalState.h"
#import "consts.h"

@implementation WYUserInfo
@synthesize authToken = _authToken;
@synthesize userName =_userName;
@synthesize userImageUrl = _userImageUrl;


- (BOOL)isLogin {
    if (self.authToken != nil && [self.authToken length]!=0) {
        return YES;
    }
    
    return NO;
}

- (NSString *)authToken {
    if (_authToken == nil) {
        _authToken = [[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_TOKEN];
    }
    
    return _authToken;
}

- (void)setAuthToken:(NSString *)authToken {
    _authToken = authToken;
    [[NSUserDefaults standardUserDefaults] setObject:_authToken forKey:WY_USER_TOKEN];
}

- (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_NAME];
    }
    
    return _userName;
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:WY_USER_NAME];
}

- (NSString *)userImageUrl {
    if (_userImageUrl == nil) {
        _userImageUrl = [[NSUserDefaults standardUserDefaults] objectForKey:WY_USER_PROFILE_IMAGE_URL];
    }
    
    return _userImageUrl;
}

- (void)setUserImageUrl:(NSString *)userImageUrl {
    _userImageUrl = userImageUrl;
    [[NSUserDefaults standardUserDefaults] setObject:_userImageUrl forKey:WY_USER_PROFILE_IMAGE_URL];
}

- (void)logout {
	self.authToken = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:WY_USER_TOKEN];
	self.userName = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:WY_USER_NAME];
	self.userImageUrl = nil;
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:WY_USER_PROFILE_IMAGE_URL];
}


@end
