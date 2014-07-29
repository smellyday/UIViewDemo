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


@interface WYGlobalState : NSObject {
    WYSinaWeiboUserInfo *_sinaUserInfo;
    WYTencentUserInfo *_qqUserInfo;
	WYUserInfo *_wyUserInfo;
}

@property (nonatomic, strong) WYSinaWeiboUserInfo *sinaUserInfo;
@property (nonatomic, strong) WYTencentUserInfo *qqUserInfo;
@property (nonatomic, strong) WYUserInfo *wyUserInfo;

+ (id)sharedGlobalState;
- (BOOL)isLogin;
- (void)logout;

@end
