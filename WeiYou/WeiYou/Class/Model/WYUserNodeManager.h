//
//  WYUserNodeManager.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserNation.h"
#import "WYUserCity.h"
#import "WYUserSpot.h"

@interface WYUserNodeManager : NSObject {
    WYUserEarth *_userEarth;
}

@property (nonatomic, strong) WYUserEarth *userEarth;

#pragma -- init
- (id)initNewUserNodeManager;
- (id)initUserNodeManagerWithInfo:(NSDictionary *)infoDic;

#pragma -- operate
- (void)addNation:(WYUserNation *)nation;
- (void)addCity:(WYUserCity *)city;
- (void)addSpot:(WYUserSpot *)spot;

- (void)delNation:(WYUserNation *)nation;
- (void)delCity:(WYUserCity *)city;
- (void)delSpot:(WYUserSpot *)spot;
- (void)delSpotsInArray:(NSArray *)spotsArr;


#pragma -- fetch info. For use in case.
- (NSArray *)getAllUserNations;
- (NSArray *)getAllUserCities;
- (NSArray *)getAllUserSpots;

- (WYUserNation *)getUserNationWithSameNationID:(NSUInteger)nationID;
- (WYUserCity *)getUserCityWithSameCityID:(NSUInteger)cityID;
- (WYUserSpot *)getUserSpotWithSameSpotID:(NSUInteger)spotID;

@end
