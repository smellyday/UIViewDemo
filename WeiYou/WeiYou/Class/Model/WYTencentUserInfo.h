//
//  WYTencentUserInfo.h
//  WeiYou
//
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYTencentUserInfo : NSObject {
    NSString *_authToken;
    NSString *_userID;
    NSString *_userName;
    NSString *_userImageUrl;
    UIImage *_userImage;
}

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userImageUrl;
@property (nonatomic, strong) UIImage *userImage;

@end
//  Created by zhangpan on 14-7-25.
