//
//  WYUserDestinations.h
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserEarth.h"
#import "WYUserContinent.h"
#import "WYUserNation.h"
#import "WYUserCity.h"
#import "WYSysEarth.h"

@interface WYUserDestinations : NSObject {
	WYUserEarth *_userEarth;
}

@property (nonatomic ,readonly) WYUserEarth *userEarth;

- (id)initUserDestinationsWithSysEarth:(WYSysEarth *)sysEarth;

//- (void)addUserNode:(WYUserNode **)userNode;
- (void)addContinent:(WYUserContinent **)nContinent;
- (void)addNation:(WYUserNation **)nNation;
- (void)addCity:(WYUserCity **)nCity;
- (void)delUserNode:(WYUserNode **)userNode;

- (NSArray *)getUserAllContinents;
- (NSArray *)getUserAllNations;
- (NSArray *)getUserNationsInContinentWithID:(NSInteger)continentID;
- (NSArray *)getUserNationsInContinent:(WYUserContinent *)continent;
- (NSArray *)getUserAllCities;
- (NSArray *)getUserCitiesInNationWithID:(NSInteger)nationID;
- (NSArray *)getUserCitiesInNation:(WYUserNation *)nation;

@end
