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
    
    NSOperationQueue *_biSyncQueue;
    
    NSMutableArray *_allContinents;
    WYMTrip *_creatingTrip;
}

@property (nonatomic, strong) NSMutableArray *trips;
@property (nonatomic, strong) NSOperationQueue *biSyncQueue;
@property (nonatomic, readonly) NSMutableArray *allContinents;
@property (nonatomic, readonly) WYMTrip *creatingTrip;

+ (id)sharedDataEngine;

//create new trip
- (void)createNewTrip;
- (void)finishCreatingTrip;

//sync
- (void)bisynchronizeTrips;
- (void)loadTripsFromLocal;
- (void)saveTripsToLocal;


@end
