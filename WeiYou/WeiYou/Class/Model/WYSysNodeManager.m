//
//  WYSysNodeManager.m
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSysNodeManager.h"

@implementation WYSysNodeManager
@synthesize sysEarthNode = _sysEarthNode;

// --------------------



#pragma -- init
- (id)initSysNodeTree {
    self = [super init];
    if (self) {
        _sysEarthNode = [[WYSysEarth alloc] initEarth];
    }
    
    return self;
}

+ (id)sharedSysNodeManager {
    static WYSysNodeManager *sharedSysNodeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSysNodeManager = [[self alloc] initSysNodeTree];
    });
    
    return sharedSysNodeManager;
}



#pragma -- operate
- (NSArray *)getSysAllContinents {
    return nil;
}

- (NSArray *)getSysAllNationsInContinentWithID:(NSInteger)continentID {
    return nil;
}

- (NSArray *)getSysAllNationsInContinent:(WYSysContinent *)continent {
    return nil;
}
















































@end
