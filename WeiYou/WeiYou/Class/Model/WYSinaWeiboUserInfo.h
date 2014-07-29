//
//  WYSinaWeiboUserInfo.h
//  WeiYou
//
//  Created by zhangpan on 14-7-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYSinaWeiboUserInfo : NSObject {
    NSString *_authToken;/*must have*/
    NSString *_userID;/*must have*/
	
    NSString *_userName;
    NSString *_userImageUrl;
}

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageUrl;

- (BOOL)isLogin;
- (void)logout;

@end
