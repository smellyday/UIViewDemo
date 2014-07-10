//
//  WYDataEngine.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYMTrip;
@interface WYDataEngine : NSObject {
	NSMutableArray *_trips;
}

@property (nonatomic, strong) NSMutableArray *trips;

+ (id)sharedDataEngine;

- (void)bisynchronizeTrips;
- (void)synchronizeTrip:(WYMTrip *)trip;
- (BOOL)checkNewVersion;

//private
- (NSString *)getTripListVersionFromServer;//return the version of the whole trips list.
- (NSString *)getTripListVersionFromLocal;
- (NSArray *)getTripsFromServer;
- (NSArray *)getTripsFromLocal;

@end
