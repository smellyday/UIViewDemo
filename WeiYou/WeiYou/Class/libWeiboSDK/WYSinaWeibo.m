//
//  WYSinaWeibo.m
//  WeiYou
//
//  Created by zhangpan on 14-6-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSinaWeibo.h"

@implementation WYSinaWeibo
@synthesize authToken = _authToken;
@synthesize userID = _userID;
@synthesize userName =_userName;
@synthesize userImageUrl = _userImageUrl;
@synthesize userImage = _userImage;

- (void)clear {
    self.authToken = nil;
    self.userID = nil;
    self.userName = nil;
    self.userImage = nil;
    self.userImageUrl = nil;
}

@end
