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
        NSArray *daysInfoArr = [infoDic objectForKey:WY_TRIP_DAYS];
        for (int cnt = 0; cnt < [daysInfoArr count]; cnt++) {
            
            NSMutableDictionary *dayDicInfo = [NSMutableDictionary dictionaryWithDictionary:[daysInfoArr objectAtIndex:cnt]];
            [dayDicInfo setObject:[NSNumber numberWithInt:(cnt+1)] forKey:WY_TRIP_DAYTH];
            if (_tripBeginDate != nil) {
                NSDate *md = [NSDate dateWithTimeInterval:WY_DAY_INTERVAL*cnt sinceDate:_tripBeginDate];
                [dayDicInfo setObject:md forKey:WY_TRIP_DATE];
            }
			WYMTripDay *tripday = [[WYMTripDay alloc] initTripDayInfoDic:dayDicInfo];
			[daysArr addObject:tripday];
            
        }
		self.tripDaysArray = daysArr;
        
	}
	return self;
}


- (NSDictionary *)transferToDic {
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
    [infoDic setObject:_tripName forKey:WY_TRIP_NAME];
    [infoDic setObject:_tripDescription forKey:WY_TRIP_DES];
    [infoDic setObject:_tripMainImage forKey:WY_TRIP_MAIN_IMAGE];
    [infoDic setObject:_tripBeginDate forKey:WY_TRIP_BEGIN_DATE];
    [infoDic setObject:_tripEndDate forKey:WY_TRIP_PREPARE_LIST];
    
    NSMutableArray *daysArr = [NSMutableArray arrayWithCapacity:10];
    for (WYMTripDay *tripDay in _tripDaysArray) {
        NSDictionary *dayInfoDic = [tripDay transferToDic];
        [daysArr addObject:dayInfoDic];
    }
    [infoDic setObject:daysArr forKey:WY_TRIP_DAYS];

    
    return (NSDictionary *)infoDic;
}

@end
