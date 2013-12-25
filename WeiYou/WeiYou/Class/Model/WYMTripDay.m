//
//  WYMTripDay.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMTripDay.h"
#import "WYMContinent.h"
#import "WYMBookedHotel.h"
#import "WYMTraffic.h"
#import "consts.h"

@implementation WYMTripDay
@synthesize continentsArray = _continentsArray;
@synthesize hotelsArray = _hotelsArray;
@synthesize trafficArray = _trafficArray;
@synthesize date = _date;
@synthesize dateStr = _dateStr;
@synthesize weekDayStr = _weekDayStr;
@synthesize dayTH = _dayTH;
@synthesize dayTHStr = _dayTHStr;

- (id)initTripDayInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
			//date
		self.date = [infoDic objectForKey:WY_TRIP_DATE];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterLongStyle];
		self.dateStr = [formatter stringFromDate:self.date];
		formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
		formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
		self.weekDayStr = [formatter stringFromDate:self.date];
		
			//dayth
		self.dayTH = [infoDic objectForKey:WY_TRIP_DAYTH];
//		NSCalendar *calendar = [NSCalendar currentCalendar];
//		NSDateComponents *component = [calendar components:NSCalendarUnitWeekday fromDate:self.date];
//		self.weekDayStr = [NSString stringWithFormat:@"%li", (long)[component weekday]];
		self.dayTHStr = [NSString stringWithFormat:@"第%d天", [_dayTH intValue]];

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
		
	}
	return self;
}

@end
