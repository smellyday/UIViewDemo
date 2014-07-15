//
//  WYMTripDay.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMTripDay.h"
#import "WYMSpot.h"
#import "consts.h"

@implementation WYMTripDay
@synthesize tripBeginDate = _tripBeginDate;
@synthesize date = _date;
@synthesize spots = _spots;
@synthesize dateStr = _dateStr;
@synthesize weekDayStr = _weekDayStr;
@synthesize dayTH = _dayTH;
@synthesize dayTHStr = _dayTHStr;

- (id)initTripDayInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
        
		//dayth
        self.dayTH = [infoDic objectForKey:WY_TRIPDAY_DAYTH];
        if (_dayTH != nil) {
            self.dayTHStr = [NSString stringWithFormat:@"第%d天", [_dayTH intValue]+1];
        }
		
		//spotsDay
		self.spots = [NSMutableArray arrayWithCapacity:10];
		NSArray *spotsInfoArr = [infoDic objectForKey:WY_TRIPDAY_SPOTS];
		for (NSDictionary *spotInfoDic in spotsInfoArr) {
			WYMSpot *mspot = [[WYMSpot alloc] initWithSpotInfoDic:spotInfoDic];
			[_spots addObject:mspot];
		}
		
        
//		NSCalendar *calendar = [NSCalendar currentCalendar];
//		NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:self.date];
//		self.weekDayStr = [NSString stringWithFormat:@"%li", (long)[component weekday]];

        /*
			//continent
		NSMutableArray *continentsArr = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *ctnDic in [infoDic objectForKey:WY_TRIP_CONTINENTS]) {
			WYMContinent *continent = [[WYMContinent alloc] initWithContinentInfoDic:ctnDic];
			[continentsArr addObject:continent];
		}
		self.continentsArray = continentsArr;

			//traffic
		self.trafficArray = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *trafficDic in [infoDic objectForKey:WY_TRIP_TRAFFICS]) {
			WYMTraffic *traffic = [[WYMTraffic alloc] initWithTrafficInfoDic:trafficDic];
			[self.trafficArray addObject:traffic];
		}

			//booked room
		self.hotelsArray = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *hotelDic in [infoDic objectForKey:WY_TRIP_HOTELS]) {
			WYMBookedHotel *bookedHotel = [[WYMBookedHotel alloc] initWithBookedHoteInfoDic:hotelDic];
			[self.hotelsArray addObject:bookedHotel];
		}
         */
		
	}
	return self;
}


- (void)updateDateInfoWithBeginDate:(NSDate *)mBeginDate {
    self.tripBeginDate = mBeginDate;
    
    if (_tripBeginDate != nil && _dayTH != nil) {
        self.date = [NSDate dateWithTimeInterval:WY_DAY_INTERVAL*[_dayTH intValue] sinceDate:_tripBeginDate];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterLongStyle];
        self.dateStr = [formatter stringFromDate:self.date];
        formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        self.weekDayStr = [formatter stringFromDate:self.date];
    }
}

- (void)updateDateInfoWithDayth:(NSNumber *)daythNum {
    self.dayTH = daythNum;
    if (_dayTH != nil) {
        self.dayTHStr = [NSString stringWithFormat:@"第%d天", [_dayTH intValue]+1];
        
        if (_tripBeginDate != nil) {
            self.date = [NSDate dateWithTimeInterval:WY_DAY_INTERVAL*[_dayTH intValue] sinceDate:_tripBeginDate];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterLongStyle];
            self.dateStr = [formatter stringFromDate:self.date];
            formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
            formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            self.weekDayStr = [formatter stringFromDate:self.date];
        }
        
    }
}

- (NSDictionary *)transferToDic {
	
	NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[infoDic setObject:_dayTH forKey:WY_TRIPDAY_DAYTH];
    
//    NSMutableArray *spotsArr = [NSMutableArray arrayWithCapacity:10];
//    for (WYMSpot *spot in _spots) {
//        NSDictionary *spotInfoDic = [spot transferToDic];
//        [spotsArr addObject:spotInfoDic];
//    }
//    [infoDic setObject:spotsArr forKey:WY_TRIPDAY_SPOTS];
	
    return (NSDictionary *)infoDic;
}

@end
