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
    BOOL _boolLogin;
    WYSinaWeibo *_sinaWeibo;
}

@property (nonatomic) BOOL boolLogin;
@property (nonatomic, strong) WYSinaWeibo *sinaWeibo;

+ (id)sharedGlobalState;

@end
