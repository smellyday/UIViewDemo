//
//  WYFunctionUtility.m
//  WeiYou
//
//  Created by zhangpan on 14-8-11.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYFunctionUtility.h"

@implementation WYFunctionUtility


+ (BOOL)isLeapYear:(NSInteger)year {
    
    if ((year%4==0 && year%100!=0) || (year%400==0)) {
        return YES;
    }
    
    return NO;
}

@end
