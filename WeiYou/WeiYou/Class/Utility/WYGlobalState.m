//
//  WYGlobalState.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYGlobalState.h"
#import "consts.h"
#import "KeychainItemWrapper.h"
#import <Security/Security.h>
#import "SecurityUtil.h"

@implementation WYGlobalState
@synthesize sinaUserInfo = _sinaUserInfo;
@synthesize qqUserInfo = _qqUserInfo;
@synthesize wyUserInfo = _wyUserInfo;
@synthesize cp = _cp;

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

- (NSString *)cp {
    if (_cp == nil) {
        mlog(@"--------------------- cp is nil");
        _cp = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_PARAM_CP];
        mlog(@"== get cp from user defaults : %@", _cp);
        if (_cp == nil || [_cp length]==0) {
            NSString *uuid = [WYGlobalState getUUID];
            NSString *channel = APP_CHANNEL;
            NSString *factory = @"AppleInc";
            NSString *device = [[UIDevice currentDevice] model];
            NSString *os = [[UIDevice currentDevice] systemVersion];
            NSString *platform = @"1001";
            NSString *appversion = APP_VERSION;
            
            CGFloat scale = [[UIScreen mainScreen] scale];
            NSString *initCP = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%i|%i|", uuid, channel, factory, device, os, platform, appversion, (int)(scale*SCREEN_WIDTH), (int)(scale*SCREEN_HEIGHT)];
            mlog(@"== create init cp : %@", initCP);
            _cp = [SecurityUtil encodeBase64String:initCP];
            [[NSUserDefaults standardUserDefaults] setObject:_cp forKey:GLOBAL_PARAM_CP];
            mlog(@"== create encoded cp : %@", _cp);
        }
    }
    
    return _cp;
}

+ (NSString *)getUUID {
    NSString *mUUID = [[NSUserDefaults standardUserDefaults] objectForKey:GLOBAL_PARAM_UUID];
    mlog(@"== get mUUID from user defaults : %@", mUUID);
    if (mUUID == nil || [mUUID length]==0) {
        KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:KEYCHAIN_ID accessGroup:APP_GROUP];
        
        mUUID = [wrapper objectForKey:(__bridge id)kSecValueData];
        mlog(@"== get mUUID from keychain : %@", mUUID);
        if (mUUID == nil || [mUUID length]==0) {
            mUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            mlog(@"== init mUUID from uuid : %@", mUUID);
            
            [wrapper setObject:@"uuid" forKey:(__bridge id)kSecAttrService];
            [wrapper setObject:mUUID forKey:(__bridge id)kSecValueData];
            [[NSUserDefaults standardUserDefaults] setObject:mUUID forKey:GLOBAL_PARAM_UUID];
        }
    }
    
    return mUUID;
}

- (BOOL)isLogin {
	
	BOOL sinabool = [_sinaUserInfo isLogin];
	BOOL qqbool = [_qqUserInfo isLogin];
	BOOL wybool = [_wyUserInfo isLogin];
	
    return sinabool||qqbool||wybool;
}

- (void)logout {
	[_sinaUserInfo logout];
	[_qqUserInfo logout];
	[_wyUserInfo logout];
}

@end
