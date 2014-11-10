//
//  WYUserSpot.m
//  WeiYou
//
//  Created by zhangpan on 14/11/5.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserSpot.h"

@implementation WYUserSpot
@synthesize corSysSpot = _corSysSpot;
@synthesize userParentCity = _userParentCity;
@synthesize isSpotInUserNodeTree = _isSpotInUserNodeTree;
@synthesize countInTheTrip = _countInTheTrip;
@synthesize commonInfoInAllTrip = _commonInfoInAllTrip;
@synthesize commonInfoInTheTrip = _commonInfoInTheTrip;
@synthesize ownInfo = _ownInfo;

// ----------------



#pragma -- init
- (id)initUserSpotInNodeTreeWithSysSpot:(WYSysSpot *)sysSpot {
    self = [super init];
    if (self) {
        _corSysSpot = sysSpot;
        _isSpotInUserNodeTree = YES;
        _countInTheTrip = 0;
        self.ownInfo = nil;
    }
    
    return self;
}

- (id)initUserSpotInTripDayArrayWithSysSpot:(WYSysSpot *)sysSpot {
    self = [super init];
    if (self) {
        _corSysSpot = sysSpot;
        _isSpotInUserNodeTree = NO;
        _countInTheTrip = -1;
    }
    
    return self;
}



#pragma -- operate
- (void)increaseCountInTheTrip {
    if (_isSpotInUserNodeTree) {
        _countInTheTrip ++;
    }
}

- (void)decreaseCountInTheTrip {
    if (_isSpotInUserNodeTree) {
        _countInTheTrip --;
    }
    
    NSAssert(_countInTheTrip < 0, @"CountInTheTrip can not be negetive in the NodeTree");
}

































@end
