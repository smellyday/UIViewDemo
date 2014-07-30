//
//  WYURLUtility.m
//  WeiYou
//
//  Created by zhangpan on 14-7-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYURLUtility.h"
#import "consts.h"
#import "WYGlobalState.h"
#import "SecurityUtil.h"

@implementation WYURLUtility

+ (NSURL *)getWYLoginURL {
    
	NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
	NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@", BASE_WY_URL_STR, INTERFACE_LOGIN, cp, ev];
    
    return [NSURL URLWithString:urlStr];
}

@end
