//
//  WYGlobalState.h
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSinaWeibo.h"

@interface WYGlobalState : NSObject {
    WYSinaWeibo *_sinaWeibo;
}

@property (nonatomic, strong) WYSinaWeibo *sinaWeibo;

+ (id)sharedGlobalState;
- (BOOL)ifUserLogIn;

@end
