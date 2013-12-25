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
@synthesize tripName = _tripName;
@synthesize tripDescription = _tripDescription;
@synthesize tripMainImage = _tripMainImage;
@synthesize tripBeginDate = _tripBeginDate;
@synthesize tripEndDate = _tripEndDate;
@synthesize tripDaysArray = _tripDaysArray;
@synthesize tripPrepareArray = _tripPrepareArray;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.tripName = [infoDic objectForKey:WY_TRIP_NAME];
		self.tripDescription = [infoDic objectForKey:WY_TRIP_DES];
		self.tripMainImage = [UIImage imageWithData:[infoDic objectForKey:WY_TRIP_MAIN_IMAGE]];
		self.tripBeginDate = [infoDic objectForKey:WY_TRIP_BEGIN_DATE];
		self.tripEndDate = [infoDic objectForKey:WY_TRIP_END_DATE];
		self.tripPrepareArray = [infoDic objectForKey:WY_TRIP_PREPARE_LIST];
		
		NSMutableArray *daysArr = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *dayDic in [infoDic objectForKey:WY_TRIP_DAYS]) {
			WYMTripDay *tripday = [[WYMTripDay alloc] initTripDayInfoDic:dayDic];
			[daysArr addObject:tripday];
		}
		self.tripDaysArray = daysArr;
	}
	return self;
}

@end
