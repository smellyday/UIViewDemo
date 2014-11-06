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



- (id)initUserSpotInNodeTreeWithSysSpot:(WYSysSpot *)sysSpot {
    self = [super init];
    if (self) {
        self.corSysSpot = sysSpot;
        self.isSpotInUserNodeTree = YES;
        _countInTheTrip = 1;
        self.ownInfo = nil;
    }
    
    return self;
}

- (id)initUserSpotInTripDayArrayWithSysSpot:(WYSysSpot *)sysSpot {
    self = [super init];
    if (self) {
        self.corSysSpot = sysSpot;
        self.isSpotInUserNodeTree = YES;
        _countInTheTrip = 0;
    }
    
    return self;
}



- (void)increaseCountInTheTrip {
    if (_countInTheTrip > 0) {
        _countInTheTrip ++;
    }
}

- (void)decreaseCountInTheTrip {
    if (_countInTheTrip > 1) {
        _countInTheTrip --;
    }
}

@end
