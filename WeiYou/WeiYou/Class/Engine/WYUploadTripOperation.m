//
//  WYUploadTripOperation.m
//  WeiYou
//
//  Created by zhangpan on 14-7-17.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUploadTripOperation.h"
#import "ASIHTTPRequest.h"
#import "consts.h"

@implementation WYUploadTripOperation
@synthesize sym = _sym;
@synthesize trip = _trip;

- (id)initWithTrip:(WYUserTrip *)mtrip {
    self = [super init];
    if (self) {
        self.trip = mtrip;
    }
    
    return self;
}


- (void)main {
    // 1. tranfer _trip to json.
    // 2. upload.
    
    for (int i = 0; i < 100; i++) {
        mlog(@"operation %d%d%d ...", _sym, _sym, _sym);
    }
    
    if (self.isCancelled) {
        return;
    }
    
    NSURL *updateURL = [NSURL URLWithString:@"http://www.baidu.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:updateURL];
    [request startSynchronous];
    
    NSError *error = [request error];
    if (!error) {
        NSString *reponse = [error description];
        mlog(@"error info is %@", reponse);
    }
    NSData *responseData = [request responseData];
    mlog(@"\n\nrequest success and data is \n%@", [responseData description]);
}

@end
