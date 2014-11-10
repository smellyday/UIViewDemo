//
//  WYDataEngine.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysNodeManager.h"
#import "WYUserTripAgent.h"

@class WYMTrip;
@interface WYDataEngine : NSObject {
    NSOperationQueue *_biSyncQueue;
    
    WYUserTripAgent *_userTripAgent;
	WYSysNodeManager *_sysNodeManager;
    WYMTrip *_creatingTrip;
}

@property (nonatomic, strong) NSOperationQueue *biSyncQueue;

@property (nonatomic, readonly) WYUserTripAgent *userTripAgent;
@property (nonatomic, readonly) WYSysNodeManager *sysNodeManager;
@property (nonatomic, strong) WYMTrip *creatingTrip;

+ (id)sharedDataEngine;

/*
//create new trip
- (void)createNewTrip;
- (void)finishCreatingTrip;
- (void)cancelCreatingTrip;

//sync
- (void)bisynchronizeTrips;
- (void)saveTripsToLocal;
*/

@end
