//
//  WYMCity.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMCity.h"
#import "consts.h"

@implementation WYMCity
@synthesize cityID = _cityID;
@synthesize cityName = _cityName;
@synthesize cityDescription = _cityDescription;

- (id)initWithCityInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.cityID = [infoDic objectForKey:WY_CITY_ID];
		self.cityName = [infoDic objectForKey:WY_CITY_NAME];
		self.cityDescription = [infoDic objectForKey:WY_CITY_DES];
	}
	return self;
}

- (NSDictionary *)transferToDic {
    return nil;
}

- (NSArray *)getAllSpots {
	return nil;
}

@end
