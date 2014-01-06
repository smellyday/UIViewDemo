//
//  WYCMTraffic.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMTraffic.h"
#import "consts.h"

@implementation WYCMTraffic

@dynamic trafficType;
@dynamic takeOffTime;
@dynamic departurePlace;
@dynamic destinationPlace;
@dynamic trafficPrice;
@dynamic flightNumberStr;
@dynamic trainNumberStr;
@dynamic tripDay;

@synthesize takeOffTimeStr;


- (void)prepareTrafficInfoWith:(NSDictionary *)infoDic {
    self.trafficType = [infoDic objectForKey:WY_TRAFFIC_TYPE];
    self.takeOffTime = [infoDic objectForKey:WY_TRAFFIC_TAKE_OFF_TIME];
    self.departurePlace = [infoDic objectForKey:WY_TRAFFIC_DEPARTURE_PLACE];
    self.destinationPlace = [infoDic objectForKey:WY_TRAFFIC_DESTINATION_PLACE];
    self.trafficPrice = [infoDic objectForKey:WY_TRAFFIC_PRICE];
    
    if ([self.trafficType intValue] == 1) {
        self.flightNumberStr = [infoDic objectForKey:WY_TRAFFIC_FLIGHT_NUMBER];
    } else if ([self.trafficType intValue] == 2) {
        self.trainNumberStr = [infoDic objectForKey:WY_TRAFFIC_TRAIN_NUMBER];
    }
    
    if (self.takeOffTime != nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterLongStyle];
		self.takeOffTimeStr = [formatter stringFromDate:self.takeOffTime];
    }
}

- (void)prepareTrafficInfo {
    if (self.takeOffTime != nil) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterLongStyle];
		self.takeOffTimeStr = [formatter stringFromDate:self.takeOffTime];
    }
}

@end
