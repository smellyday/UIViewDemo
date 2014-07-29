//
//  WYUserInfo.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYUserInfo : NSObject {
    NSString *_authToken;/*must have*/
    NSString *_userID;/*must have*/
	
    NSString *_userName;
    NSString *_userImageUrl;
    UIImage *_userImage;
}

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageUrl;
@property (nonatomic, strong) UIImage *userImage;

- (BOOL)isLogin;
- (void)logout;

@end
