//
//  WYMTraffic.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMTraffic.h"
#import "consts.h"

@implementation WYMTraffic
@synthesize trafficType = _trafficType;
@synthesize takeOffTime = _takeOffTime;
@synthesize takeOffTimeStr = _takeOffTimeStr;
@synthesize departurePlace = _departurePlace;
@synthesize destinationPlace = _destinationPlace;
@synthesize trafficPrice = _trafficPrice;
@synthesize flightNumberStr = _flightNumberStr;
@synthesize trainNumberStr = _trainNumberStr;

- (id)initWithTrafficInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		NSNumber *typeNumber = [infoDic objectForKey:WY_TRAFFIC_TYPE];
		if ([typeNumber intValue] == 1) {
			self.trafficType = WYPlane;
			self.flightNumberStr = [infoDic objectForKey:WY_TRAFFIC_FLIGHT_NUMBER];
		} else if ([typeNumber intValue] == 2) {
			self.trafficType = WYTrain;
			self.trainNumberStr = [infoDic objectForKey:WY_TRAFFIC_TRAIN_NUMBER];
		} else if ([typeNumber intValue] == 3) {
			self.trafficType = WYCar;
		} else {
			self.trafficType = WYTrafficNone;
		}
		
		self.takeOffTime = [infoDic objectForKey:WY_TRAFFIC_TAKE_OFF_TIME];
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterLongStyle];
		self.takeOffTimeStr = [formatter stringFromDate:self.takeOffTime];
		
		self.trafficPrice = [infoDic objectForKey:WY_TRAFFIC_PRICE];
		self.departurePlace = [infoDic objectForKey:WY_TRAFFIC_DEPARTURE_PLACE];
		self.destinationPlace = [infoDic objectForKey:WY_TRAFFIC_DESTINATION_PLACE];
	}
	return self;
}

@end
