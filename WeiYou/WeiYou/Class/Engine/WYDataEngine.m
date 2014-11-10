//
//  WYDataEngine.m
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYDataEngine.h"
#import "WYUserTrip.h"
#import "WYBiSyncTripsOperation.h"
#import "consts.h"

@interface WYDataEngine (private)

- (void)loadTripsFromServerWithPage:(int)page;
- (void)updateToServerWithTrip:(WYMTrip *)trip;


- (BOOL)checkNewVersion;
- (NSArray *)getTripsInfoDicFromServer;
- (NSArray *)getTripsInfoDicFromLocal;

@end

@implementation WYDataEngine
@synthesize biSyncQueue = _biSyncQueue;
@synthesize userTripAgent = _userTripAgent;
@synthesize creatingTrip = _creatingTrip;
@synthesize sysNodeManager = _sysNodeManager;


+ (id)sharedDataEngine {
	static WYDataEngine *sharedEngine = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedEngine = [[self alloc] init];
	});
	
	return sharedEngine;
}



/*
 
 
 
 
 
//==========Lazy init property=============
- (WYSysDestinations *)sysDestinationAgent {
	if (!_sysDestinationAgent) {
		_sysDestinationAgent = [[WYSysDestinations alloc] initSysDestinations];
	}
	
	return _sysDestinationAgent;
}

- (WYUserTripAgent *)userTripAgent {
    if (!_userTripAgent) {
        _userTripAgent = [[WYUserTripAgent alloc] initUserTripAgent];
    }
    
    return _userTripAgent;
}



//=========create new trip===========
- (void)createNewTrip {
    NSAssert(_creatingTrip == nil, @"_creatingTrip must be nil");
    _creatingTrip = [[WYMTrip alloc] init];
}

- (void)finishCreatingTrip {
    NSAssert(_creatingTrip != nil, @"_creatingTrip could not be nil");
    [_userTripAgent insertObject:_creatingTrip inUserTripsAtIndex:0];
    _creatingTrip = nil;
}

- (void)cancelCreatingTrip {
    _creatingTrip = nil;
}
 
 
 
 
 
*/



/*




//==========   syn   ==========

- (void)bisynchronizeTrips {
    
    [self.biSyncQueue cancelAllOperations];
    WYBiSyncTripsOperation *bisyncOp = [[WYBiSyncTripsOperation alloc] init];
    [self.biSyncQueue addOperation:bisyncOp];
    
}


- (NSOperationQueue *)biSyncQueue {
    if (!_biSyncQueue) {
        _biSyncQueue = [[NSOperationQueue alloc] init];
        _biSyncQueue.name = @"bi sync queue";
        _biSyncQueue.maxConcurrentOperationCount = 1;
    }
    return _biSyncQueue;
}


- (BOOL)checkNewVersion {
    
    return YES;
}


- (void)updateToServerWithTrip:(WYMTrip *)trip {
    //    NSDictionary *tripDic = [trip transferToDic];

     // upload tripDic to server using api.
    
}




*/





/*
- (void)loadTripsFromLocal {
    
    self.userTripsArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *allTripsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
    for (NSDictionary *infoDic in allTripsInfo) {
        WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
        [self.userTripsArr addObject:mt];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_TRIPS_SYNC_FINISH object:nil userInfo:nil];
}
 */



/*

// save the local version after modifying the trip.
- (void)saveTripsToLocal {
    mlog(@"save begin at %@", [[NSDate date] description]);
    NSArray *dataArr = [self objectsToArray];
    if (dataArr != nil) {
        BOOL saveOK = [[self objectsToArray] writeToFile:[self getDataPath] atomically:YES];
        if (saveOK) {
            mlog(@"save success.");
        } else {
            mlog(@"save fail.");
        }
    }
    mlog(@"save end at %@", [[NSDate date] description]);
}


#pragma private function.

- (NSArray *)getTripsInfoDicFromServer {
    NSMutableArray *retTripArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *basicTripArr = [self getTripBasicInfoListFromServer];
    for (WYMTrip *trip in basicTripArr) {
        WYMTrip *mt = [self getTripInfoFromServerWithID:trip.tripID];
        [retTripArr addObject:mt];
    }
    
    return (NSArray *)retTripArr;
//    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
}


- (NSArray *)getTripsInfoDicFromLocal {
    NSString *dataPath = [self getDataPath];
    
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:dataPath];
    if (!fileExist) {
        mlog(@"file is not exist");
        return nil;
    }
    
    NSMutableArray *tripsArrayFromFile = [NSMutableArray arrayWithCapacity:10];
    [tripsArrayFromFile addObjectsFromArray:[NSArray arrayWithContentsOfFile:dataPath]];
    
    return tripsArrayFromFile;
}


- (NSArray *)getTripBasicInfoListFromServer {
    return nil;// An array of WYMTrip
}


- (WYMTrip *)getTripInfoFromServerWithID:(NSNumber *)tripID {
    return nil;
}


- (NSString *)getDataPath {
    NSArray *userDomainArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [userDomainArray lastObject];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.plist", docPath, @"tripData"];
    return filePath;
}
 
 
 
 
 */


/*
 objects change to array, then can save to file.
 */
//- (NSArray *)objectsToArray {
//    
//    return nil;
//}





@end
