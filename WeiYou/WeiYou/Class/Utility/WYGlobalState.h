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


@interface WYGlobalState : NSObject {
    WYSinaWeiboUserInfo *_sinaUserInfo;
    WYTencentUserInfo *_qqUserInfo;
}

@property (nonatomic, strong) WYSinaWeiboUserInfo *sinaUserInfo;
@property (nonatomic, strong) WYTencentUserInfo *qqUserInfo;

+ (id)sharedGlobalState;
- (BOOL)isLogIn;

@end
