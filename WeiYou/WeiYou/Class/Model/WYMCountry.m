//
//  WYMCountry.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMCountry.h"
#import "consts.h"

@implementation WYMCountry
@synthesize countryID = _countryID;
@synthesize parentID = _parentID;
@synthesize level = _level;
@synthesize countryName = _countryName;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		_countryID = [infoDic objectForKey:WY_COUNTRY_ID];
		_parentID = [infoDic objectForKey:WY_COUNTRY_PARENT_ID];
		_level = [infoDic objectForKey:WY_SPOT_LEVEL];
		_countryName = [infoDic objectForKey:WY_COUNTRY_NAME];
	}
	return self;
}

- (NSDictionary *)transferToDic {
    return nil;
}

- (NSArray *)getAllProvinces {
	return nil;
}

- (NSArray *)getAllCities {
	return nil;
}

@end
