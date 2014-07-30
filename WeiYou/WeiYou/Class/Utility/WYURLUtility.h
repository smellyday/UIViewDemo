//
//  WYURLUtility.h
//  WeiYou
//
//  Created by zhangpan on 14-7-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BASE_WY_URL_STR		@"http://app.bailinglvxing.com/?r="
#define INTERFACE_LOGIN     @"/passport/login"
#define PARAM_CP            @"cp"
#define PARAM_EV            @"ev"

@interface WYURLUtility : NSObject

+ (NSURL *)getWYLoginURL;

@end
