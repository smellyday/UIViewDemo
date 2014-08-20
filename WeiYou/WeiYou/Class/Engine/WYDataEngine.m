//
//  WYDataEngine.m
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYDataEngine.h"
#import "WYMTrip.h"
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
@synthesize userTripsArr = _userTripsArr;
@synthesize biSyncQueue = _biSyncQueue;
@synthesize creatingTrip = _creatingTrip;
@synthesize sysDestinationAgent = _sysDestinationAgent;


+ (id)sharedDataEngine {
	static WYDataEngine *sharedEngine = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedEngine = [[self alloc] init];
	});
	
	return sharedEngine;
}

//=========create new trip===========
- (void)createNewTrip {
    NSAssert(_creatingTrip == nil, @"_creatingTrip must be nil");
    _creatingTrip = [[WYMTrip alloc] init];
}

- (void)finishCreatingTrip {
    [_userTripsArr addObject:_creatingTrip];
    _creatingTrip = nil;
}

- (void)cancelCreatingTrip {
    _creatingTrip = nil;
}

//==========   syn   ==========
/*
 this function should be in secondary thread.
 */
- (void)bisynchronizeTrips {
    
    [self.biSyncQueue cancelAllOperations];
    WYBiSyncTripsOperation *bisyncOp = [[WYBiSyncTripsOperation alloc] init];
    [self.biSyncQueue addOperation:bisyncOp];
    
    // temp
//    NSArray *allTripsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
//    for (NSDictionary *infoDic in allTripsInfo) {
//        WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
//        [self.trips addObject:mt];
//    }
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:WY_NOTI_TRIPS_SYNC_FINISH object:nil userInfo:nil];
    
    // 某trip，是新建trip（）
    
    //if (某trip，“本地有”而“server上没有”)
    //{
        //if (“本地trip”是NewTrip)
        //{
            //上传此trip到服务器
        //}
        //else
        //{
            //此trip必定在server上已经删除，本地还没有同步删除操作。
            //if (本地trip有了修改) 把此trip当做NewTrip上传服务器
            //else 同步server上的删除操作，在本地删除此trip。
        //}
    //}
    
    
    //if (某trip，“本地没有”而“server上有”) <本地做删除的trip操作，除非同步服务器并得到成功的返回，否则只是不显示，不会真正的从本地删除>
    //{
        //download server上的版本到本地
    //}
    
    
    //if (某trip，“本地”和“server”上都有)
    //{
        //if (server上的版本比本地的版本新)
        //{
            //if (本地有更新 OR 本地有删除操作) 本地有更新询问用户要选择哪个版本？ 本地有删除操作，直接覆盖server上的新版本到本地
            //else if (本地没有更新)
            //{
                //server上的版本覆盖本地版本
            //}
            //else 这里不应该走到
        //}
        //else if (server上的版本和本地的版本相同)
        //{
            //if (本地有更新 OR 本地有删除操作) 有更新就更新，有删除就删除
        //}
        //else
        //{
            //不可能到这里
        //}
    //}
    
    
    /*
    NSArray *serverTripsArr = [self getTripsFromServer];//reorder basing on ID. From Big to small.
    NSArray *localTripsArr = [self getTripsFromLocal];//reorder basing onID. From Big to small.
    
    for (int ln = 0; ln < [localTripsArr count]; ln++) {
        WYMTrip *lTrip = (WYMTrip *)[localTripsArr objectAtIndex:ln];
        
        if (lTrip.isNewTrip) {
            //this is a new trip, and should upload this trip right now.
        } else {
            
            for (int sn = 0; sn < [serverTripsArr count]; sn++) {
                WYMTrip *sTrip = (WYMTrip *)[serverTripsArr objectAtIndex:ln];
                
                if (lTrip.tripID > sTrip.tripID) {
                    // 说明“本地有”且“server上没有”，且lTrip不是new trip
                    
                    if (lTrip.shouldUpdate) {
                        // server上删除了此行程，但本地同步删除操作前又进行了编辑。策略：此trip按照new trip上传服务器。
                    } else {
                        // server上删除了此行程，本地没有额外编辑。策略：同步删除操作。
                    }
                    
                } else if (lTrip.tripID == sTrip.tripID) {
                    // 说明“本地”和“server”上都有这个trip
                    
                    if (lTrip.tripVersion < sTrip.tripVersion) {
                        // server上的版本比本地的版本新
                        
                        if (lTrip.shouldUpdate) {
                            // server上有了新的版本，本地在同步新版本之前做了变更。策略：询问用户，选择服务器上的版本，还是本地的版本？
                        } else {
                            // 下载server上的版本，更新本地的版本。
                        }
                        
                    } else if (lTrip.tripVersion == sTrip.tripVersion) {
                        // server上的版本 == 本地的版本
                        
                        if (lTrip.shouldUpdate) {
                            // 上传本地版本到server，更新server上的版本。
                        }
                        
                    } else {
                        // 不应该走到这里，本地版本号不可能比server上的更新。
                    }
                    
                }
                
            }
            
        }
        
    }
     */
    
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
    /*
     upload tripDic to server using api.
     */
    
}

- (void)loadTripsFromLocal {
    
    self.userTripsArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *allTripsInfo = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
    for (NSDictionary *infoDic in allTripsInfo) {
        WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
        [self.userTripsArr addObject:mt];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_TRIPS_SYNC_FINISH object:nil userInfo:nil];
    
//    self.trips = [NSMutableArray arrayWithCapacity:10];
//    NSArray *allTripsInfo = [self getTripsInfoDicFromLocal];
//    for (NSDictionary *infoDic in allTripsInfo) {
//        WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
//        [self.trips addObject:mt];
//    }
}


/*
 save the local version after modifying the trip.
 */
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


/*
 objects change to array, then can save to file.
 */
- (NSArray *)objectsToArray {
    if (_userTripsArr) {
        
        NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:10];
        for (WYMTrip *trip in _userTripsArr) {
            NSDictionary *infoDic = [trip transferToDic];
            [dataArr addObject:infoDic];
        }
        
        return dataArr;
    }
    
    return nil;
}


//==========Destination DATA=============
- (WYSysDestinations *)sysDestinationAgent {
	if (!_sysDestinationAgent) {
		_sysDestinationAgent = [[WYSysDestinations alloc] initSysDestinations];
	}
	
	return _sysDestinationAgent;
}


@end
