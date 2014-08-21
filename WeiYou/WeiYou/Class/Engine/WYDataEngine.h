//
//  WYDataEngine.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysDestinations.h"
#import "WYUserTripAgent.h"

@class WYMTrip;
@interface WYDataEngine : NSObject {
	NSMutableArray *_userTripsArr;
    NSOperationQueue *_biSyncQueue;
    
    WYUserTripAgent *_userTripAgent;
	WYSysDestinations *_sysDestinationAgent;
    WYMTrip *_creatingTrip;
}

@property (nonatomic, strong) NSMutableArray *userTripsArr;
@property (nonatomic, strong) NSOperationQueue *biSyncQueue;

@property (nonatomic, readonly) WYUserTripAgent *userTripAgent;
@property (nonatomic, readonly) WYSysDestinations *sysDestinationAgent;
@property (nonatomic, strong) WYMTrip *creatingTrip;

+ (id)sharedDataEngine;

//create new trip
- (void)createNewTrip;
- (void)finishCreatingTrip;
- (void)cancelCreatingTrip;

//sync
- (void)bisynchronizeTrips;
- (void)loadTripsFromLocal;
- (void)saveTripsToLocal;


@end
