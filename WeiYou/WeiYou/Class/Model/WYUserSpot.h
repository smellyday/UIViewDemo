//
//  WYUserSpot.h
//  WeiYou
//
//  Created by zhangpan on 14/11/5.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysSpot.h"
#import "WYUserCity.h"

@interface WYUserSpot : NSObject {
    WYSysSpot *_corSysSpot;
    WYUserCity * __weak _userParentCity;
    
    BOOL _isSpotInUserNodeTree;
    NSUInteger _countInTheTrip; // This should be 0, when the spot obj is in the TripDay's spot Array.
    
    NSString *_commonInfoInAllTrip;
    NSString *_commonInfoInTheTrip;
    NSString *_ownInfo; // This should be nil, when the spot obj is in the NodeTree.
}

@property (nonatomic, readonly) WYSysSpot *corSysSpot;
@property (nonatomic, weak) WYUserCity *userParentCity;
@property (nonatomic) BOOL isSpotInUserNodeTree;
@property (nonatomic, readonly) NSUInteger countInTheTrip;
@property (nonatomic, strong) NSString *commonInfoInAllTrip;
@property (nonatomic, strong) NSString *commonInfoInTheTrip;
@property (nonatomic, strong) NSString *ownInfo;

#pragma -- init
- (id)initUserSpotInNodeTreeWithSysSpot:(WYSysSpot *)sysSpot;
- (id)initUserSpotInTripDayArrayWithSysSpot:(WYSysSpot *)sysSpot;

#pragma -- operate
- (void)increaseCountInTheTrip;
- (void)decreaseCountInTheTrip;

@end
