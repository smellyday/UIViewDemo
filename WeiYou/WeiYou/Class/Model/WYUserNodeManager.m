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
- (void)addNation:(WYUserNation *)nation {
    
}

- (void)addCity:(WYUserCity *)city {
    
}

- (void)addSpot:(WYUserSpot *)spot {
    NSArray *userCitiesArray = [self getAllUserCities];
    for (WYUserCity *userCity in userCitiesArray) {
        if (userCity.corSysCity.sysMID == spot.corSysSpot.sysParentID) {
            [userCity.spotsArray addObject:spot];
            spot.userParentCity = userCity;
            return;
        }
    }
    
    /*add city to the tree.*/
}


- (void)delNation:(WYUserNation *)nation {
    
}

- (void)delCity:(WYUserCity *)city {
    
}

- (void)delSpot:(WYUserSpot *)spot {
    
}

- (void)delSpotsInArray:(NSArray *)spotsArr {
    
}



#pragma -- fetch info. For use in case.
- (NSArray *)getAllUserNations {
    NSMutableArray *userNationsArr = [NSMutableArray arrayWithCapacity:10];
    for (WYUserContinent *continent in _userEarth.userContinentsArray) {
        [userNationsArr addObjectsFromArray:continent.userNationsArray];
    }
    
    return (NSArray *)userNationsArr;
}

- (NSArray *)getAllUserCities {
    NSMutableArray *userCitiesArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *userNationsArr = [self getAllUserNations];
    for (WYUserNation *userNation in userNationsArr) {
        [userCitiesArr addObjectsFromArray:userNation.userCitiesArray];
    }
    
    return (NSArray *)userCitiesArr;
}

- (NSArray *)getAllUserSpots {
    NSMutableArray *userSpotsArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *userCitiesArr = [self getAllUserCities];
    for (WYUserCity *userCity in userCitiesArr) {
        [userSpotsArr addObjectsFromArray:userCity.spotsArray];
    }
    
    return (NSArray *)userSpotsArr;
}


- (WYUserNation *)getUserNationWithSameNationID:(NSUInteger)nationID {
    NSArray *userNationsArr = [self getAllUserNations];
    for (WYUserNation *userNation in userNationsArr) {
        if (userNation.corSysNation.sysMID == nationID) {
            return userNation;
        }
    }
    
    return nil;
}

- (WYUserCity *)getUserCityWithSameCityID:(NSUInteger)cityID {
    NSArray *userCitiesArr = [self getAllUserCities];
    for (WYUserCity *userCity in userCitiesArr) {
        if (userCity.corSysCity.sysMID == cityID) {
            return userCity;
        }
    }
    
    return nil;
}

- (WYUserSpot *)getUserSpotWithSameSpotID:(NSUInteger)spotID {
    NSArray *userSpotsArr = [self getAllUserSpots];
    for (WYUserSpot *userSpot in userSpotsArr) {
        if (userSpot.corSysSpot.sysMID == spotID) {
            return userSpot;
        }
    }
    
    return nil;
}
































@end
