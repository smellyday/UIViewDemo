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
- (void)addContinentToNodeTree:(WYUserContinent *)continent;
- (void)addNationToNodeTree:(WYUserNation *)nation;
- (void)addCityToNodeTree:(WYUserCity *)city;
- (void)addSpotToNodeTree:(WYUserSpot *)spot;

- (void)delNationFromNodeTree:(WYUserNation *)nation;
- (void)delCityFromNodeTree:(WYUserCity *)city;
- (void)delSpotFromNodeTree:(WYUserSpot *)spot;
- (void)delSpotsInArrayFromNodeTree:(NSArray *)spotsArr;

#pragma -- fetch info. For use in case.
- (NSArray *)getAllUserContinentsInNodeTree;
- (NSArray *)getAllUserNationsInNodeTree;
- (NSArray *)getAllUserCitiesInNodeTree;
- (NSArray *)getAllUserSpotsInNodeTree;

- (WYUserNation *)getUserNationInNodeTreeWithSameNationID:(NSUInteger)nationID;
- (WYUserCity *)getUserCityInNodeTreeWithSameCityID:(NSUInteger)cityID;
- (WYUserSpot *)getUserSpotInNodeTreeWithSameSpotID:(NSUInteger)spotID;


@end
