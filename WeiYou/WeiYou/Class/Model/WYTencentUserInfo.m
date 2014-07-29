//
//  WYTencentUserInfo.m
//  WeiYou
//
//  Created by zhangpan on 14-7-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYTencentUserInfo.h"
#import "consts.h"

@implementation WYTencentUserInfo
@synthesize authToken = _authToken;
@synthesize openID = _openID;
@synthesize expirationDate = _expirationDate;
@synthesize userName = _userName;
@synthesize userImage = _userImage;
@synthesize userImageUrl = _userImageUrl;

- (BOOL)isLogin {
    if (self.authToken != nil && [self.authToken length]!=0 && self.openID != nil && [self.openID length]!=0 && self.expirationDate != nil) {
        return YES;
    }
    return NO;
}

- (NSString *)authToken {
    if (_authToken == nil) {
        _authToken = [[NSUserDefaults standardUserDefaults] objectForKey:QQ_USER_TOKEN];
    }
    
    return _authToken;
}

- (void)setAuthToken:(NSString *)authToken {
    _authToken = authToken;
    [[NSUserDefaults standardUserDefaults] setObject:_authToken forKey:QQ_USER_TOKEN];
}

- (NSString *)openID {
    if (_openID == nil) {
        _openID = [[NSUserDefaults standardUserDefaults] objectForKey:QQ_OPEN_ID];
    }
    
    return _openID;
}

- (void)setOpenID:(NSString *)openID {
    _openID = openID;
    [[NSUserDefaults standardUserDefaults] setObject:_openID forKey:QQ_OPEN_ID];
}

- (NSDate *)expirationDate {
    if (_expirationDate == nil) {
        _expirationDate = [[NSUserDefaults standardUserDefaults] objectForKey:QQ_EXPIRATION_DATE];
    }
    
    return _expirationDate;
}

- (void)setExpirationDate:(NSDate *)expirationDate {
    _expirationDate = expirationDate;
    [[NSUserDefaults standardUserDefaults] setObject:_expirationDate forKey:QQ_EXPIRATION_DATE];
}

- (NSString *)userName {
    if (_userName == nil) {
        _userName = [[NSUserDefaults standardUserDefaults] objectForKey:QQ_USER_NAME];
    }
    
    return _userName;
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:QQ_USER_NAME];
}

- (NSString *)userImageUrl {
    if (_userImageUrl == nil) {
        _userImageUrl = [[NSUserDefaults standardUserDefaults] objectForKey:QQ_USER_PROFILE_IMAGE_URL];
    }
    return _userImageUrl;
}

- (void)setUserImageUrl:(NSString *)userImageUrl {
    _userImageUrl = userImageUrl;
    [[NSUserDefaults standardUserDefaults] setObject:_userImageUrl forKey:QQ_USER_PROFILE_IMAGE_URL];
}

- (void)clear {
    
}


@end