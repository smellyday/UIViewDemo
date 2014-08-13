//
//  WYDataEngine.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMCity.h"
#import "WYMCountry.h"
#import "WYMContinent.h"

@class WYMTrip;
@interface WYDataEngine : NSObject {
	NSMutableArray *_trips;
    
    NSOperationQueue *_biSyncQueue;
}

@property (nonatomic, strong) NSMutableArray *trips;
@property (nonatomic, strong) NSOperationQueue *biSyncQueue;

+ (id)sharedDataEngine;

- (void)bisynchronizeTrips;

- (void)loadTripsFromLocal;
- (void)saveTripsToLocal;

	//Spot data
- (WYMCity *)getCityByID:(NSNumber *)city_id;
- (WYMCountry *)getCountryByID:(NSNumber *)country_id;
- (WYMContinent *)getContinentByID:(NSNumber *)continent_id;

@end
