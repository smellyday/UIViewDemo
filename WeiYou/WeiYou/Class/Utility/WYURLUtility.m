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

+ (NSURL *)getWYRegSendMsgURL {
    
    NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
    NSString *mode = @"0";
	NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@&mode=%@", BASE_WY_URL_STR, INTERFACE_SENDMSG, cp, ev, mode];
    
    return [NSURL URLWithString:urlStr];
}

+ (NSURL *)getWYRegURL {
    NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
	NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@", BASE_WY_URL_STR, INTERFACE_REG, cp, ev];
    
    return [NSURL URLWithString:urlStr];
}

+ (NSURL *)getWYResetSendMsgURL {
    NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
    NSString *mode = @"1";
	NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@&mode=%@", BASE_WY_URL_STR, INTERFACE_SENDMSG, cp, ev, mode];
    
    return [NSURL URLWithString:urlStr];
}

+ (NSURL *)getWYResetPWDURL {
    NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
	NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@", BASE_WY_URL_STR, INTERFACE_RESET, cp, ev];
    
    return [NSURL URLWithString:urlStr];
}

+ (NSURL *)getThirdPartLoginCallBackURL {
    NSString *cp = [[WYGlobalState sharedGlobalState] cp];
	NSString *ev = @"1";
    NSString *urlStr = [NSString stringWithFormat:@"%@%@&cp=%@&ev=%@", BASE_WY_URL_STR, INTERFACE_CALLBACK, cp, ev];
    
    return [NSURL URLWithString:urlStr];
}

@end
