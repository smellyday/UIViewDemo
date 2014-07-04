//
//  WYMTrip.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMTrip.h"
#import "WYMTripDay.h"
#import "consts.h"

@implementation WYMTrip
@synthesize tripID = _tripID;
@synthesize tripName = _tripName;
@synthesize tripDescription = _tripDescription;
@synthesize tripMainImageURL = _tripMainImageURL;
@synthesize tripBeginDate = _tripBeginDate;
@synthesize tripEndDate = _tripEndDate;
@synthesize tripCreateDate = _tripCreateDate;
@synthesize tripDaysArray = _tripDaysArray;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.tripID = [infoDic objectForKey:WY_TRIP_ID];
		self.tripName = [infoDic objectForKey:WY_TRIP_NAME];
		self.tripDescription = [infoDic objectForKey:WY_TRIP_DES];
		self.tripMainImageURL = [infoDic objectForKey:WY_TRIP_MAIN_IMAGE_URL];
		self.tripBeginDate = [infoDic objectForKey:WY_TRIP_BEGIN_DATE];
		self.tripEndDate = [infoDic objectForKey:WY_TRIP_END_DATE];
		self.tripCreateDate = [infoDic objectForKey:WY_TRIP_CREATE_DATE];
		
		_tripDaysArray = [NSMutableArray arrayWithCapacity:10];
        NSArray *daysInfoArr = [infoDic objectForKey:WY_TRIP_DAYS];
		for (NSDictionary *dayInfoDic in daysInfoArr) {
			WYMTripDay *tripDay = [[WYMTripDay alloc] initTripDayInfoDic:dayInfoDic];
			if (_tripBeginDate) {
				tripDay.date = [NSDate dateWithTimeInterval:WY_DAY_INTERVAL*[[tripDay dayTH] intValue] sinceDate:_tripBeginDate];
			}
			[_tripDaysArray addObject:tripDay];
		}
	}
	return self;
}


- (NSDictionary *)transferToDic {
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [infoDic setObject:_tripName forKey:WY_TRIP_NAME];
    [infoDic setObject:_tripDescription forKey:WY_TRIP_DES];
    [infoDic setObject:_tripMainImageURL forKey:WY_TRIP_MAIN_IMAGE_URL];
    [infoDic setObject:_tripBeginDate forKey:WY_TRIP_BEGIN_DATE];
    
    NSMutableArray *daysArr = [NSMutableArray arrayWithCapacity:10];
    for (WYMTripDay *tripDay in _tripDaysArray) {
        NSDictionary *dayInfoDic = [tripDay transferToDic];
        [daysArr addObject:dayInfoDic];
    }
    [infoDic setObject:daysArr forKey:WY_TRIP_DAYS];

    
    return (NSDictionary *)infoDic;
}

@end
