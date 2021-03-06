//
//  WYBiSyncTripsOperation.m
//  WeiYou
//
//  Created by zhangpan on 14-7-23.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYBiSyncTripsOperation.h"
#import "ASIHTTPRequest.h"
#import "consts.h"

@interface WYBiSyncTripsOperation (private)

@end


@implementation WYBiSyncTripsOperation

- (void)main {
    @autoreleasepool {
        mlog(@"########################################################");
        NSURL *updateURL = [NSURL URLWithString:@"http://www.baidu.com"];
        ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:updateURL];
        
        if (self.isCancelled) {
            return;
        }
        [request startSynchronous];
        
        if (self.isCancelled) {
            return;
        }
        NSError *error = [request error];
        if ([error description] != nil) {
            mlog(@"error info is %@", [error description]);
        } else {
            NSData *responseData = [request responseData];
            mlog(@"\n\nrequest success and data is \n%@", [responseData description]);
            
        }
        mlog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }
}

@end
