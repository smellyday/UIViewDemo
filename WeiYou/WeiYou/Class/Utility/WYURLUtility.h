//
//  WYURLUtility.h
//  WeiYou
//
//  Created by zhangpan on 14-7-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASE_WY_URL_STR             @"http://app.bailinglvxing.com/?r="
#define INTERFACE_LOGIN             @"/passport/login"
#define INTERFACE_SENDMSG           @"/passport/sendsmscode"

#define PARAM_CP                    @"cp"
#define PARAM_EV                    @"ev"
#define PARAM_MODE                  @"mode"

@interface WYURLUtility : NSObject

+ (NSURL *)getWYLoginURL;
+ (NSURL *)getWYSendMsgURL;

@end
