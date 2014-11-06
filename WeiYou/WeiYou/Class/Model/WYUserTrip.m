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
        self.daysManager = [[WYUserDayManager alloc] initNewUserDayManager];
        self.nodesManager = [[WYUserNodeManager alloc] initNewUserNodeManager];
    }
    
    return self;
}

- (id)initUserTripWithInfo:(NSDictionary *)tripInfoDic {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}



#pragma -- operate spot
// -- add -->
- (void)addNation:(WYUserNation *)nation {
    [self.nodesManager addNation:nation];
}

- (void)addCity:(WYUserCity *)city {
    [self.nodesManager addCity:city];
}

/*
 dayth == 0 : means user didn't assign dayth to the spot, just collect spot to the city.
 spot.isSpotInUserNodeTree == YES : means "add this spot from a city."
 spot.isSpotInUserNodeTree == NO  : means "add this spot from a day"
 */
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth {
    
    if (spot.isSpotInUserNodeTree) {
        
        [self.nodesManager addSpot:spot];
        if (dayth > 0) {
            WYUserSpot *daySpot = [[WYUserSpot alloc] initUserSpotInTripDayArrayWithSysSpot:spot.corSysSpot];
            daySpot.commonInfoInTheTrip = spot.commonInfoInTheTrip;
            /*[spot addObserver:daySpot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            [self.daysManager addSpot:daySpot toDayth:dayth];
        }
        
    } else {
        
        NSAssert(dayth == 0, @"dayth cannot be 0 here. Spot must add from someday, not from city.");
        
        WYUserSpot *spotInTree = [self.nodesManager getSpotWithCorSysSpot:spot.corSysSpot];
        if (spotInTree) {
            spot.commonInfoInTheTrip = spotInTree.commonInfoInTheTrip;
            /*[spotInTree addObserver:spot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            [self.daysManager addSpot:spot toDayth:dayth];
            [spotInTree increaseCountInTheTrip];
        } else {
            spotInTree = [[WYUserSpot alloc] initUserSpotInNodeTreeWithSysSpot:spot.corSysSpot];
            /*[spotInTree addObserver:spot forKeyPath:@"whenCommonInfoInTheTripChanged" options: context:];*/
            [self.nodesManager addSpot:spotInTree];
            [self.daysManager addSpot:spot toDayth:dayth];
        }
        
    }
    
}

// -- del -->
- (void)delNation:(WYUserNation *)nation {
    [self.nodesManager delNation:nation];
    [self.daysManager delSpotInNation:nation];
}

- (void)delCity:(WYUserCity *)city {
    [self.nodesManager delCity:city];
    [self.daysManager delSpotInCity:city];
}

- (void)delSpot:(WYUserSpot *)spot {
    [self.nodesManager delSpot:spot];
    [self.daysManager delSpot:spot];
}



#pragma -- operate tripday
- (void)addNewTripDay {
    WYTripDay *oneTripDay = [[WYTripDay alloc] init];
    [self.daysManager addOneTripDay:oneTripDay];
}

- (void)delOneTripDay:(WYTripDay *)oneTripDay {
    [self.daysManager delOneTripDay:oneTripDay];
    [self.nodesManager delSpotsInArray:oneTripDay.spotsArray];
}

@end
