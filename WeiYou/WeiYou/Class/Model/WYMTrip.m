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
@synthesize tripVersion = _tripVersion;
@synthesize tripOrder = _tripOrder;
@synthesize tripID = _tripID;
@synthesize tripName = _tripName;
@synthesize tripDescription = _tripDescription;
@synthesize tripMainImageURL = _tripMainImageURL;
@synthesize tripBeginDate = _tripBeginDate;
@synthesize tripEndDate = _tripEndDate;
@synthesize tripCreateDate = _tripCreateDate;
@synthesize tripDaysArray = _tripDaysArray;
@synthesize isNewTrip = _isNewTrip;
@synthesize deletTrip = _deletTrip;
@synthesize shouldUpdate = _shouldUpdate;
@synthesize changeWhenUploading = _changeWhenUploading;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.tripVersion = [infoDic objectForKey:WY_TRIP_VERSION];
		self.tripOrder = [infoDic objectForKey:WY_TRIP_ORDER];
		self.tripID = [infoDic objectForKey:WY_TRIP_ID];
		self.tripName = [infoDic objectForKey:WY_TRIP_NAME];
		self.tripDescription = [infoDic objectForKey:WY_TRIP_DES];
		self.tripMainImageURL = [infoDic objectForKey:WY_TRIP_MAIN_IMAGE_URL];
		self.tripBeginDate = [infoDic objectForKey:WY_TRIP_BEGIN_DATE];
		self.tripEndDate = [infoDic objectForKey:WY_TRIP_END_DATE];
		self.tripCreateDate = [infoDic objectForKey:WY_TRIP_CREATE_DATE];
		
		self.tripDaysArray = [NSMutableArray arrayWithCapacity:10];
        NSArray *daysInfoArr = [infoDic objectForKey:WY_TRIP_DAYS];
		for (NSDictionary *dayInfoDic in daysInfoArr) {
			WYMTripDay *tripDay = [[WYMTripDay alloc] initTripDayInfoDic:dayInfoDic];
            [tripDay updateDateInfoWithBeginDate:_tripBeginDate];
			[_tripDaysArray addObject:tripDay];
		}
		
        // the 4 bool must be in the plist. Cz, plist is created by object.
		self.isNewTrip = [infoDic objectForKey:WY_TRIP_ISNEW];
		self.deletTrip = [infoDic objectForKey:WY_TRIP_ISDEL];
		self.shouldUpdate = [infoDic objectForKey:WY_TRIP_UPDATE];
		self.changeWhenUploading = [infoDic objectForKey:WY_TRIP_CHANGE];
	}
	return self;
}

- (void)addNewTripToServer {
    
}

- (void)deleteTripFromServer {
    
}

- (void)updateTripInfoToServer {
    
}

- (void)updateTripInfoFromServer {
    
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
