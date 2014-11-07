//
//  WYUserTrip.m
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserTrip.h"

@implementation WYUserTrip
@synthesize tripID = _tripID;
@synthesize tripVersion = _tripVersion;
@synthesize tripName = _tripName;
@synthesize tripMainImageURL = _tripMainImageURL;
@synthesize tripBeginDate = _tripBeginDate;
@synthesize tripEndDate = _tripEndDate;
@synthesize tripCreateDate = _tripCreateDate;

@synthesize daysManager = _daysManager;
@synthesize nodesManager = _nodesManager;

//-----------------------------------------------


#pragma -- init trip
- (id)initUserTripWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.tripName = name;
        _daysManager = [[WYUserDayManager alloc] initNewUserDayManager];
        _nodesManager = [[WYUserNodeManager alloc] initNewUserNodeManager];
    }
    
    return self;
}

- (id)initUserTripWithInfo:(NSDictionary *)tripInfoDic {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}



#pragma -- operate --> add spot
- (void)collectNation:(WYUserNation *)nation {
    [_nodesManager addNation:nation];
}

- (void)collectCity:(WYUserCity *)city {
    [_nodesManager addCity:city];
}

- (void)collectSpot:(WYUserSpot *)spot {
    WYUserSpot *spotInTheTree = [_nodesManager getUserSpotWithSameSpotID:spot.corSysSpot.sysMID];
    if (spotInTheTree) {
        [spotInTheTree collectMe];
    } else {
        spotInTheTree = [[WYUserSpot alloc] initUserSpotInNodeTreeWithSysSpot:spot.corSysSpot];
        [_nodesManager addSpot:spotInTheTree];
    }
}

/*
 dayth == 0 : means user didn't assign dayth to the spot, just collect spot to the city.
 spot.isSpotInUserNodeTree == YES : means "add this spot from a city."
 spot.isSpotInUserNodeTree == NO  : means "add this spot from a day"
 */
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth {
    
    if (spot.isSpotInUserNodeTree) { // spot node must be not in the tree.
        
        [spot collectMe];
        [_nodesManager addSpot:spot];
        if (dayth > 0) {
            
            WYUserSpot *daySpot = [[WYUserSpot alloc] initUserSpotInTripDayArrayWithSysSpot:spot.corSysSpot];
            /*[spot addObserver:daySpot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            
            // the next two must be show at the same time.
            [_daysManager addSpot:daySpot toDayth:dayth];
            [spot increaseCountInTheTrip];
            
        }
        
    } else {
        
        NSAssert(dayth == 0, @"dayth cannot be 0 here. Spot must add from someday, not from city.");
        
        WYUserSpot *spotInTree = [_nodesManager getUserSpotWithSameSpotID:spot.corSysSpot.sysMID];
        if (spotInTree) {
            
            spot.commonInfoInTheTrip = spotInTree.commonInfoInTheTrip;
            /*[spotInTree addObserver:spot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            
            [_daysManager addSpot:spot toDayth:dayth];
            [spotInTree increaseCountInTheTrip];
            
        } else {
            
            spotInTree = [[WYUserSpot alloc] initUserSpotInNodeTreeWithSysSpot:spot.corSysSpot];
            /*[spotInTree addObserver:spot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            
            [_nodesManager addSpot:spotInTree];
            [_daysManager addSpot:spot toDayth:dayth];
            [spotInTree increaseCountInTheTrip];
            
        }
        
    }
    
}

#pragma -- operate --> del spot
/*
 Must delete from NodeTree.
 */
- (void)uncollectNation:(WYUserNation *)nation {
    [_nodesManager delNation:nation];
    [_daysManager delAllSpotsInNation:nation];
}

/*
 Must delete from NodeTree.
 */
- (void)uncollectCity:(WYUserCity *)city {
    [_nodesManager delCity:city];
    [_daysManager delAllSpotsInCity:city];
}

- (void)uncollectSpot:(WYUserSpot *)spot {
    WYUserSpot *spotInTheTree = [_nodesManager getUserSpotWithSameSpotID:spot.corSysSpot.sysMID];
    NSAssert(!spotInTheTree, @"Why, why, why this spot cannot be found in the NodeTree?");
    if (spotInTheTree) {
        [spotInTheTree uncollectMe];
        if (spotInTheTree.countInTheTrip == 0 && !spotInTheTree.isCollectedSpot) {
            [self delSpotFromNodeTree:spotInTheTree];
        }
    }
}

- (void)delSpotFromNodeTree:(WYUserSpot *)spot {
    [_nodesManager delSpot:spot];
    if (spot.countInTheTrip > 0) {
        [_daysManager delAllSpotsWithSameID:spot.corSysSpot.sysMID];
    }
}

- (void)delSpot:(WYUserSpot *)spot fromSomeDay:(WYTripDay *)oneTripDay {
    [oneTripDay delSpot:spot];
    
    WYUserSpot *spotInTree = [_nodesManager getUserSpotWithSameSpotID:spot.corSysSpot.sysMID];
    NSAssert(!spotInTree, @"There must have a corresponding spot in the NodeTree");
    if (spotInTree) {
        [spotInTree decreaseCountInTheTrip];
        if (spotInTree.countInTheTrip == 0 && !spotInTree.isCollectedSpot) {
            [self delSpotFromNodeTree:spotInTree];
        }
    }
}

- (void)delSpot:(WYUserSpot *)spot fromDayth:(NSUInteger)dayth {
    [_daysManager delSpot:spot fromDayth:dayth];
    /**/
}



#pragma -- operate tripday
- (void)addNewTripDay {
    WYTripDay *oneTripDay = [[WYTripDay alloc] init];
    [_daysManager addOneTripDay:oneTripDay];
}

- (void)delOneTripDay:(WYTripDay *)oneTripDay {
    [_daysManager delOneTripDay:oneTripDay];
    [_nodesManager delSpotsInArray:oneTripDay.spotsArray];
}
























































@end
