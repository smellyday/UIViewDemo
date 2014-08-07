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

//typedef enum _WhoLogin {
//    NOLogin = 0,
//	SinaLogin = 1,
//    TencentLogin = 2,
//	WYLogin = 3
//} WhoLogin;

@interface WYGlobalState : NSObject {
    WYSinaWeiboUserInfo *_sinaUserInfo;
    WYTencentUserInfo *_qqUserInfo;
	WYUserInfo *_wyUserInfo;
    
    NSString *_cp;
}

@property (nonatomic, strong) WYSinaWeiboUserInfo *sinaUserInfo;
@property (nonatomic, strong) WYTencentUserInfo *qqUserInfo;
@property (nonatomic, strong) WYUserInfo *wyUserInfo;
@property (nonatomic, strong) NSString *cp;

+ (id)sharedGlobalState;
+ (NSString *)getUUID;

- (BOOL)isLogin;
- (void)logout;

@end
