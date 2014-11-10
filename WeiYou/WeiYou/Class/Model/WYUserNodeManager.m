//
//  WYUserNodeManager.m
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserNodeManager.h"
#import "WYSysNodeManager.h"

@implementation WYUserNodeManager
@synthesize userEarth = _userEarth;

// -------------



#pragma -- init
- (id)initNewUserNodeManager {
    self = [super init];
    if (self) {
        WYSysNodeManager *sharedSysUserNodeManager = [WYSysNodeManager sharedSysNodeManager];
        self.userEarth = [[WYUserEarth alloc] initWithSysEarth:sharedSysUserNodeManager.sysEarthNode];
    }
    
    return self;
}

- (id)initUserNodeManagerWithInfo:(NSDictionary *)infoDic {
    self = [super init];
    if (self) {
        
    }
    
    return self;
}



#pragma -- operate
- (void)addContinentToNodeTree:(WYUserContinent *)continent {
    continent.userParentEarth = _userEarth;
    [_userEarth.userContinentsArray addObject:continent];
}

- (void)addNationToNodeTree:(WYUserNation *)nation {
    NSArray *userContinentsArray = [self getAllUserContinentsInNodeTree];
    for (WYUserContinent *userContinent in userContinentsArray) {
        if (userContinent.corSysContinent.sysMID == nation.corSysNation.sysParentID) {
            [userContinent.userNationsArray addObject:nation];
            nation.userParentContinent = userContinent;
            return;
        }
    }
    
    WYUserContinent *userContinent = [[WYUserContinent alloc] initWithSysContinent:nation.corSysNation.sysParentContinent];
    [userContinent.userNationsArray addObject:nation];
    nation.userParentContinent = userContinent;
    [self addContinentToNodeTree:userContinent];
}

- (void)addCityToNodeTree:(WYUserCity *)city {
    NSArray *userNationsArray = [self getAllUserNationsInNodeTree];
    for (WYUserNation *userNation in userNationsArray) {
        if (userNation.corSysNation.sysMID == city.corSysCity.sysParentID) {
            [userNation.userCitiesArray addObject:city];
            city.userParentNation = userNation;
            return;
        }
    }
    
    WYUserNation *userNation = [[WYUserNation alloc] initWithSysNation:city.corSysCity.sysParentNation];
    [userNation.userCitiesArray addObject:city];
    city.userParentNation = userNation;
    [self addNationToNodeTree:userNation];
}

- (void)addSpotToNodeTree:(WYUserSpot *)spot {
    NSArray *userCitiesArray = [self getAllUserCitiesInNodeTree];
    for (WYUserCity *userCity in userCitiesArray) {
        if (userCity.corSysCity.sysMID == spot.corSysSpot.sysParentID) {
            [userCity.userSpotsArray addObject:spot];
            spot.userParentCity = userCity;
            return;
        }
    }
    
    WYUserCity *userCity = [[WYUserCity alloc] initWithSysCity:spot.corSysSpot.sysParentCity];
    [userCity.userSpotsArray addObject:spot];
    spot.userParentCity = userCity;
    [self addCityToNodeTree:userCity];
}


- (void)delNationFromNodeTree:(WYUserNation *)nation {
    NSAssert(nation.userParentContinent == nil, @"nation's userParentContinent is nil right now.");
    if (!nation.userParentContinent) {
        [nation.userParentContinent.userNationsArray removeObject:nation];
        nation.userParentContinent = nil;
    }
}

- (void)delCityFromNodeTree:(WYUserCity *)city {
    NSAssert(city.userParentNation == nil, @"city's userParentNation is nil right now.");
    if (!city.userParentNation) {
        [city.userParentNation.userCitiesArray removeObject:city];
        city.userParentNation = nil;
    }
}

- (void)delSpotFromNodeTree:(WYUserSpot *)spot {
    NSAssert(spot.userParentCity == nil, @"spot's userParentCity is nil right now.");
    if (!spot.userParentCity) {
        [spot.userParentCity.userSpotsArray removeObject:spot];
        spot.userParentCity = nil;
    }
}

- (void)delSpotsInArrayFromNodeTree:(NSArray *)spotsArr {
    for (WYUserSpot *userSpot in spotsArr) {
        [self delSpotFromNodeTree:userSpot];
    }
}



#pragma -- fetch info. For use in case.
- (NSArray *)getAllUserContinentsInNodeTree {
    return _userEarth.userContinentsArray;
}

- (NSArray *)getAllUserNationsInNodeTree {
    NSMutableArray *userNationsArr = [NSMutableArray arrayWithCapacity:10];
    for (WYUserContinent *continent in _userEarth.userContinentsArray) {
        [userNationsArr addObjectsFromArray:continent.userNationsArray];
    }
    
    return (NSArray *)userNationsArr;
}

- (NSArray *)getAllUserCitiesInNodeTree {
    NSMutableArray *userCitiesArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *userNationsArr = [self getAllUserNationsInNodeTree];
    for (WYUserNation *userNation in userNationsArr) {
        [userCitiesArr addObjectsFromArray:userNation.userCitiesArray];
    }
    
    return (NSArray *)userCitiesArr;
}

- (NSArray *)getAllUserSpotsInNodeTree {
    NSMutableArray *userSpotsArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *userCitiesArr = [self getAllUserCitiesInNodeTree];
    for (WYUserCity *userCity in userCitiesArr) {
        [userSpotsArr addObjectsFromArray:userCity.userSpotsArray];
    }
    
    return (NSArray *)userSpotsArr;
}


- (WYUserNation *)getUserNationInNodeTreeWithSameNationID:(NSUInteger)nationID {
    NSArray *userNationsArr = [self getAllUserNationsInNodeTree];
    for (WYUserNation *userNation in userNationsArr) {
        if (userNation.corSysNation.sysMID == nationID) {
            return userNation;
        }
    }
    
    return nil;
}

- (WYUserCity *)getUserCityInNodeTreeWithSameCityID:(NSUInteger)cityID {
    NSArray *userCitiesArr = [self getAllUserCitiesInNodeTree];
    for (WYUserCity *userCity in userCitiesArr) {
        if (userCity.corSysCity.sysMID == cityID) {
            return userCity;
        }
    }
    
    return nil;
}

- (WYUserSpot *)getUserSpotInNodeTreeWithSameSpotID:(NSUInteger)spotID {
    NSArray *userSpotsArr = [self getAllUserSpotsInNodeTree];
    for (WYUserSpot *userSpot in userSpotsArr) {
        if (userSpot.corSysSpot.sysMID == spotID) {
            return userSpot;
        }
    }
    
    return nil;
}

































@end
