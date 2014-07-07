//
//  WYDataEngine.m
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYDataEngine.h"
#import "WYMTrip.h"
#import "consts.h"

@implementation WYDataEngine
@synthesize trips = _trips;


+ (id)sharedDataEngine {
	static WYDataEngine *sharedEngine = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedEngine = [[self alloc] init];
	});
	
	return sharedEngine;
}

- (void)synchronizeTrips {
    self.trips = nil;
    _trips = [NSMutableArray arrayWithCapacity:10];
    
    NSString *serverVersion = [self getTripListVersionFromServer];
    NSString *localVersion = [self getTripListVersionFromLocal];
    
    if (serverVersion == localVersion) {
        return;
    }
    
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

- (NSString *)getTripListVersionFromServer {
    return @"serverVersion";
}

- (NSString *)getTripListVersionFromLocal {
    return @"localVersion";
}

- (NSArray *)getTripsFromServer {
    NSMutableArray *retTripArr = [NSMutableArray arrayWithCapacity:10];
    NSArray *basicTripArr = [self getTripBasicInfoListFromServer];
    for (WYMTrip *trip in basicTripArr) {
        WYMTrip *mt = [self getTripInfoFromServerWithID:trip.tripID];
        [retTripArr addObject:mt];
    }
    
    return (NSArray *)retTripArr;
//    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
}

- (NSArray *)getTripsFromLocal {
    NSString *dataPath = [self getDataPath];
    
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:dataPath];
    if (!fileExist) {
        return nil;
    }
    
    NSMutableArray *tripsArrayFromFile = [NSMutableArray arrayWithCapacity:10];
    [tripsArrayFromFile addObjectsFromArray:[NSArray arrayWithContentsOfFile:dataPath]];
    
    return tripsArrayFromFile;
}


#pragma private function.
- (NSArray *)getTripBasicInfoListFromServer {
    return nil;// An array of WYMTrip
}

- (WYMTrip *)getTripInfoFromServerWithID:(NSString *)tripID {
    return nil;
}

- (NSString *)getDataPath {
    NSArray *userDomainArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [userDomainArray lastObject];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@.plist", docPath, @"tripData"];
    return filePath;
}

- (NSArray *)objectsToArray {
    if (_trips) {
        
        NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:10];
        for (WYMTrip *trip in _trips) {
            NSDictionary *infoDic = [trip transferToDic];
            [dataArr addObject:infoDic];
        }
        
        return dataArr;
    }
    
    return nil;
}

- (void)save {
    NSArray *dataArr = [self objectsToArray];
    if (dataArr != nil) {
        [[self objectsToArray] writeToFile:[self getDataPath] atomically:YES];
    }
}








/*
// ===============
- (NSArray *)getTrips {
	
	if (self.trips != nil) {
		return _trips;
	}
	
	NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
	
	NSMutableArray *tripsarr = [NSMutableArray arrayWithCapacity:10];
	for (NSDictionary *dic in arr) {
		WYMTrip *trip = [[WYMTrip alloc] initWithTripInfoDic:dic];
		[tripsarr addObject:trip];
	}
	
	return tripsarr;
	
	
	NSArray *userDomainArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *tripsFilePath = [NSString stringWithFormat:@"%@/%@", [userDomainArray objectAtIndex:0], WY_FILE_TRIPS];
	NSFileManager *mFileManager = [[NSFileManager alloc] init];
	
	if ([mFileManager fileExistsAtPath:tripsFilePath]) {
		[mFileManager removeItemAtPath:tripsFilePath error:nil];
	}
	
	{
		[mFileManager createFileAtPath:tripsFilePath contents:nil attributes:nil];
		
		NSMutableDictionary *trip1Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip1Dic setObject:@"厦门之旅" forKey:WY_TRIP_NAME];
		[trip1Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md1 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip1Dic setObject:md1 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSMutableDictionary *trip2Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip2Dic setObject:@"美国之旅" forKey:WY_TRIP_NAME];
		[trip2Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md2 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip2Dic setObject:md2 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSMutableDictionary *trip3Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip3Dic setObject:@"英国之旅" forKey:WY_TRIP_NAME];
		[trip3Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md3 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip3Dic setObject:md3 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSMutableDictionary *trip4Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip4Dic setObject:@"泰国之旅" forKey:WY_TRIP_NAME];
		[trip4Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md4 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip4Dic setObject:md4 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSMutableDictionary *trip5Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip5Dic setObject:@"香港之旅" forKey:WY_TRIP_NAME];
		[trip5Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md5 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip5Dic setObject:md5 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSMutableDictionary *trip6Dic = [NSMutableDictionary dictionaryWithCapacity:10];
		[trip6Dic setObject:@"澳门之旅" forKey:WY_TRIP_NAME];
		[trip6Dic setObject:@"this is xiamen" forKey:WY_TRIP_DES];
		NSData *md6 = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"logo" ofType:@"jpg"]];
		[trip6Dic setObject:md6 forKey:WY_TRIP_MAIN_IMAGE];
		
		NSArray *arr = [NSArray arrayWithObjects:trip1Dic, trip2Dic, trip3Dic, trip4Dic, trip5Dic, trip6Dic, nil];
		
		if ([arr writeToFile:tripsFilePath atomically:NO]) {
			mlog(@"行程false数据写入成功！");
		} else {
			mlog(@"行程false数据写入失败！");
		}
	}
	
	NSArray *fileDataArr = [NSArray arrayWithContentsOfFile:tripsFilePath];
	NSMutableArray *tripsArray = [NSMutableArray arrayWithCapacity:10];
	
	for (NSDictionary *dic in fileDataArr) {
		WYMTrip *trip = [[WYMTrip alloc] initWithTripInfoDic:dic];
		[tripsArray addObject:trip];
	}
	self.trips = tripsArray;
	
	return tripsArray;
	 
}


- (NSArray *)getCityArray {
	NSString *cityFilePath = [WYFileManager getCityArrayFilePath];
	NSFileManager *wyFileManager = [[NSFileManager alloc] init];
	
	if ([wyFileManager fileExistsAtPath:cityFilePath]) {
		[WYFileManager removeCityArrayFilePath];
	}
	
	{
		[wyFileManager createFileAtPath:cityFilePath contents:nil attributes:nil];
		
		NSDictionary *md1 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"1北京，中国", @"北京", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md2 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"2上海，中国", @"上海", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md3 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"3广州，中国", @"广州", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md4 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"4深圳，中国", @"深圳", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md5 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"5杭州，中国", @"杭州", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md6 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"6苏州，中国", @"苏州", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md7 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"7郑州，中国", @"郑州", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md8 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"8漯河，中国", @"漯河", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md9 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"9洛阳，中国", @"洛阳", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md10 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"10三门峡，中国", @"三门峡", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md11 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"11开封，中国", @"开封", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md12 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"12新乡，中国", @"北京", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSDictionary *md13 = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"13安阳，中国", @"安阳", nil] forKeys:[NSArray arrayWithObjects:WY_CITY_NAME, WY_CITY_BRIEF_NAME, nil]];
		NSArray *arr = [NSArray arrayWithObjects:md1, md2, md3, md4, md5, md6, md7, md8, md9, md10, md11, md12, md13, nil];
		
		if ([arr writeToFile:cityFilePath atomically:NO]) {
			mlog(@"%s:写入成功！！", __func__);
		} else {
			mlog(@"%s:写入失败！！", __func__);
		}
	}
	
	NSArray *fileDataArr = [NSArray arrayWithContentsOfFile:cityFilePath];
	NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:10];
	
	for (NSDictionary *mDic in fileDataArr) {
		NSString *mName = [mDic objectForKey:WY_CITY_NAME];
		NSString *mBriefName = [mDic objectForKey:WY_CITY_BRIEF_NAME];
		WYMCity *data = [[WYMCity alloc] initWithCityName:mName];
		data.briefName = mBriefName;
		[dataArr addObject:data];
	}
	
	return dataArr;
}
 */

@end
