//
//  WYCMTripDay.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMTripDay.h"
#import "WYCMTrip.h"
#import "WYCMTraffic.h"
#import "WYCMHotel.h"
#import "WYCMContinent.h"
#import "WYCMCountry.h"
#import "WYCMCity.h"
#import "WYCMSpot.h"
#import "consts.h"
#import "WYCoreDataEngine.h"


@implementation WYCMTripDay

@synthesize weekDayStr = _weekDayStr;
@synthesize dateStr = _dateStr;
@synthesize dayTHStr = _dayTHStr;
@synthesize date = _date;

@dynamic dayth;
@dynamic trip;
@dynamic continents;
@dynamic traffics;
@dynamic hotels;


- (void)prepareTripDayWithInfo:(NSDictionary *)infoDic {
	self.dayth = [infoDic objectForKey:WY_TRIP_DAYTH];
	if (self.dayth != nil) {
		self.dayTHStr = [NSString stringWithFormat:@"第%d天", [self.dayth intValue]+1];
	}
	
    if (self.trip.tripBeginDate != nil && self.dayth != nil) {
		NSInteger dayIntervalCount = [self.dayth intValue];
		self.date = [self.trip.tripBeginDate dateByAddingTimeInterval:WY_DAY_INTERVAL*dayIntervalCount];
		if (self.date != nil) {
			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
			[formatter setDateStyle:NSDateFormatterLongStyle];
			self.dateStr = [formatter stringFromDate:self.date];
			formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
			formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
			self.weekDayStr = [formatter stringFromDate:self.date];
		}
    }
    
    NSArray *hotelsArr = [infoDic objectForKey:WY_TRIP_HOTELS];
    for (NSDictionary *dic in hotelsArr) {
        WYCMHotel *hotel = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMHotel" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        hotel.tripDay = self;
        [hotel prepareHotelInfoWith:dic];
    }
    
    NSArray *trafficsArr = [infoDic objectForKey:WY_TRIP_TRAFFICS];
    for (NSDictionary *dic in trafficsArr) {
        WYCMTraffic *traffic = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMTraffic" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        traffic.tripDay = self;
        [traffic prepareTrafficInfoWith:dic];
    }
    
    NSArray *continentsArr = [infoDic objectForKey:WY_TRIP_CONTINENTS];
    for (NSDictionary *dic in continentsArr) {
        WYCMContinent *continent = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMContinent" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        continent.tripDay = self;
        [continent prepareContinentInfoWith:dic];
    }
}

- (void)prepareTripDayInfo {
	if (self.dayth != nil) {
		self.dayTHStr = [NSString stringWithFormat:@"第%d天", [self.dayth intValue]+1];
	}
	
    if (self.trip.tripBeginDate != nil && self.dayth != nil) {
		NSInteger dayIntervalCount = [self.dayth intValue];
		self.date = [self.trip.tripBeginDate dateByAddingTimeInterval:WY_DAY_INTERVAL*dayIntervalCount];
		if (self.date != nil) {
			NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
			[formatter setDateStyle:NSDateFormatterLongStyle];
			self.dateStr = [formatter stringFromDate:self.date];
			formatter.dateFormat = [NSDateFormatter dateFormatFromTemplate:@"EEE" options:0 locale:[NSLocale currentLocale]];
			formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
			self.weekDayStr = [formatter stringFromDate:self.date];
		}
    }
}

@end
