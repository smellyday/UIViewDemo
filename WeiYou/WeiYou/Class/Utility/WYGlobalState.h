//
//  WYGlobalState.h
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYGlobalState : NSObject {
    BOOL boolLogin;
}
@property (nonatomic) BOOL boolLogin;

+ (id)sharedGlobalState;

@end
