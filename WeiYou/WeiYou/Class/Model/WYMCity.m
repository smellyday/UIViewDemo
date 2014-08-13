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
@synthesize parentID = _parentID;
@synthesize level = _level;
@synthesize cityName = _cityName;

- (id)initWithCityInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		_cityID = [infoDic objectForKey:WY_CITY_ID];
		_parentID = [infoDic objectForKey:WY_CITY_PARENT_ID];
		_level = [infoDic objectForKey:WY_SPOT_LEVEL];
		_cityName = [infoDic objectForKey:WY_CITY_NAME];
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
