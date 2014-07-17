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
- (void)loadTripsFromServerWithPage:(int)page;
- (void)updateToServerWithTrip:(WYMTrip *)trip;

- (void)loadTripsFromLocal;
- (void)saveTrips;

//private
- (BOOL)checkNewVersion;
- (NSString *)getTripListVersionFromServer;//return the version of the whole trips list.
- (NSString *)getTripListVersionFromLocal;
- (NSArray *)getTripsInfoDicFromServer;
- (NSArray *)getTripsInfoDicFromLocal;


@end
