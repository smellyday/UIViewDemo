//
//  WYDataEngine.m
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYDataEngine.h"
#import "WYMTrip.h"
#import "WYMCity.h"
#import "WYFileManager.h"
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

- (NSMutableArray *)getAllTrips {
    self.trips = nil;
    _trips = [NSMutableArray arrayWithCapacity:10];
    
    //判断本地和server上的版本
    
    //如果Server版本最新，全部用server上的
    
    //如果本地版本最新，全部拿本地的
    NSArray *tripsFromLocalFile =[self getTripsFromLocalFile];
    
    for (NSDictionary *infoDic in tripsFromLocalFile) {
        WYMTrip *trip = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
        [_trips addObject:trip];
    }
    
    return _trips;
}

- (NSArray *)getTripsFromLocalFile {
    NSString *dataPath = [self getDataPath];
    
    BOOL fileExist = [[NSFileManager defaultManager] fileExistsAtPath:dataPath];
    if (!fileExist) {
        return nil;
    }
    
    NSMutableArray *tripsArrayFromFile = [NSMutableArray arrayWithCapacity:10];
    [tripsArrayFromFile addObjectsFromArray:[NSArray arrayWithContentsOfFile:dataPath]];
    
    return tripsArrayFromFile;
}

- (NSArray *)getTripsFromServer {
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
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
	
	/*
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
	 */
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


@end
