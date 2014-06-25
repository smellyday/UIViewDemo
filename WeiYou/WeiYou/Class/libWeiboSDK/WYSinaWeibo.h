//
//  WYSinaWeibo.h
//  WeiYou
//
//  Created by zhangpan on 14-6-25.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYSinaWeibo : NSObject {
    NSString *authToken;
    NSString *userID;
}

@property (nonatomic, strong) NSString *authToken;
@property (nonatomic, strong) NSString *userID;

@end
