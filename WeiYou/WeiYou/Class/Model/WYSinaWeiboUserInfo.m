//
//  WYSinaWeiboUserInfo.m
//  WeiYou
//
//  Created by zhangpan on 14-7-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSinaWeiboUserInfo.h"

@implementation WYSinaWeiboUserInfo
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
