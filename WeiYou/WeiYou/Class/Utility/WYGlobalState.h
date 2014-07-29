//
//  WYGlobalState.h
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSinaWeiboUserInfo.h"
#import "WYTencentUserInfo.h"
#import "WYUserInfo.h"

typedef enum _LoginAccount {
	SinaAccount = 0,
    TencentAccount = 1,
	WYAccount = 2
} LoginAccount;

@interface WYGlobalState : NSObject {
    WYSinaWeiboUserInfo *_sinaUserInfo;
    WYTencentUserInfo *_qqUserInfo;
	WYUserInfo *_wyUserInfo;
	
	NSNumber *_account;
	
	NSString *_userName;
    NSString *_userImageUrl;
    UIImage *_userImage;
}

@property (nonatomic, strong) WYSinaWeiboUserInfo *sinaUserInfo;
@property (nonatomic, strong) WYTencentUserInfo *qqUserInfo;
@property (nonatomic, strong) WYUserInfo *wyUserInfo;
@property (nonatomic, strong) NSNumber *account;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageUrl;
@property (nonatomic, strong) UIImage *userImage;

+ (id)sharedGlobalState;
- (BOOL)isLogin;
- (void)logout;

@end
