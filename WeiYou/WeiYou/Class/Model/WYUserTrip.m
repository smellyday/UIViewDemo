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
- (void)collectNation:(WYSysNation *)nation {
    WYUserNation *nationInTree = [_nodesManager getUserNationInNodeTreeWithSameNationID:nation.sysMID];

    if (!nationInTree) {
        nationInTree = [[WYUserNation alloc] initWithSysNation:nation];
        [_nodesManager addNationToNodeTree:nationInTree];
    }
}

- (void)collectCity:(WYSysCity *)city {
    WYUserCity *cityInTree = [_nodesManager getUserCityInNodeTreeWithSameCityID:city.sysMID];
    
    if (!cityInTree) {
        cityInTree = [[WYUserCity alloc] initWithSysCity:city];
        [_nodesManager addCityToNodeTree:cityInTree];
    }
}

- (void)collectSpot:(WYSysSpot *)spot {
    WYUserSpot *spotInTree = [_nodesManager getUserSpotInNodeTreeWithSameSpotID:spot.sysMID];
    
    if (!spotInTree) {
        spotInTree = [[WYUserSpot alloc] initUserSpotInNodeTreeWithSysSpot:spot];
        [_nodesManager addSpotToNodeTree:spotInTree];
    }
}

/*
 dayth == 0 : means user didn't assign dayth to the spot, just collect spot to the city.
 spot.isSpotInUserNodeTree == YES : means "add this spot from a city."
 spot.isSpotInUserNodeTree == NO  : means "add this spot from a day"
 */
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth {
    [self collectSpot:spot.corSysSpot];
    WYUserSpot *spotInTheTree = [_nodesManager getUserSpotInNodeTreeWithSameSpotID:spot.corSysSpot.sysMID];
    NSAssert(spotInTheTree == nil, @"The spot must be in the node tree.");
    NSAssert(dayth <= 0, @"Dayth can not be 0 or negative.");
    NSAssert(spot.isSpotInUserNodeTree == YES, @"This function is to add spot to someday.");
    
    spot.commonInfoInTheTrip = spotInTheTree.commonInfoInTheTrip;
    /*[spotInTree addObserver:spot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
    [_daysManager addSpot:spot toDayth:dayth];
    if (spotInTheTree) {
        [spotInTheTree increaseCountInTheTrip];
    }
    
}

#pragma -- operate --> del spot
- (void)uncollectNation:(WYUserNation *)nation {
    
    /*
     show alert. if uncollect this nation, all the info about the nation is going to be deleted.
     */
    
    [_nodesManager delNationFromNodeTree:nation];
    [_daysManager delAllSpotsInNation:nation];
}

- (void)uncollectCity:(WYUserCity *)city {
    
    /*
     show alert. if uncollect this city, all the info about the city is going to be deleted.
     */
    
    [_nodesManager delCityFromNodeTree:city];
    [_daysManager delAllSpotsInCity:city];
}

- (void)uncollectSpot:(WYUserSpot *)spot {
    
    /*
     show alert. if uncollect this spot, all the info about the spot is going to be deleted.
     */
    
    [_nodesManager delSpotFromNodeTree:spot];
    if (spot.countInTheTrip > 0) {
        [_daysManager delAllSpotsWithSameID:spot.corSysSpot.sysMID];
    }
}

- (void)delSpot:(WYUserSpot *)spot fromSomeDay:(WYTripDay *)oneTripDay {
    [oneTripDay delSpot:spot];
    
    WYUserSpot *spotInTree = [_nodesManager getUserSpotInNodeTreeWithSameSpotID:spot.corSysSpot.sysMID];
    if (spotInTree) {
        [spotInTree decreaseCountInTheTrip];
    }
    NSAssert(!spotInTree, @"There must have a corresponding spot in the NodeTree");
}

- (void)delSpot:(WYUserSpot *)spot fromDayth:(NSUInteger)dayth {
    [_daysManager delSpot:spot fromDayth:dayth];
    
    WYUserSpot *spotInTree = [_nodesManager getUserSpotInNodeTreeWithSameSpotID:spot.corSysSpot.sysMID];
    if (spotInTree) {
        [spotInTree decreaseCountInTheTrip];
    }
    NSAssert(!spotInTree, @"There must have a corresponding spot in the NodeTree");
}



#pragma -- operate tripday
- (void)addNewTripDay {

}

- (void)delOneTripDay:(WYTripDay *)oneTripDay {

}
























































@end
