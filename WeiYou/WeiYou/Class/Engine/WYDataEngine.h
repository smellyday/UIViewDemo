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
}

@property (nonatomic, strong) NSMutableArray *trips;
@property (nonatomic, strong) NSOperationQueue *biSyncQueue;

+ (id)sharedDataEngine;

- (void)bisynchronizeTrips;

- (void)loadTripsFromLocal;
- (void)saveTripsToLocal;

@end
