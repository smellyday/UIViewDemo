//
//  WYCMTripDay.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMTripDay.h"
#import "WYCMTraffic.h"
#import "WYCMTrip.h"
#import "consts.h"


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


- (void)initTripDayWithInfo:(NSDictionary *)infoDic {
    if (self.trip.tripBeginDate != nil) {
        self.dayth = [infoDic objectForKey:WY_TRIP_DAYTH];
        if (self.dayth != nil) {
            self.dayTHStr = [NSString stringWithFormat:@"第%d天", [self.dayth intValue]+1];
            
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
    
}

@end
