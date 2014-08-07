//
//  WYTencentUserInfo.h
//  WeiYou
//
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYTencentUserInfo : NSObject {
    NSString *_authToken;/*must have*/
    NSString *_openID;/*must have*/
    NSDate *_expirationDate;/*must have*/
	
    NSString *_userName;
    NSString *_userImageUrl;
    NSString *_wyToken;
}

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *openID;
@property (nonatomic, strong) NSDate *expirationDate;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageUrl;
@property (nonatomic, strong) NSString *wyToken;

- (BOOL)isLogin;
- (void)logout;

@end
//  Created by zhangpan on 14-7-25.
