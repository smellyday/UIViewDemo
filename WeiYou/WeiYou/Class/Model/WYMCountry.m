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
@synthesize countryName = _countryName;
@synthesize countryDescription = _countryDescription;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.countryID = [infoDic objectForKey:WY_COUNTRY_ID];
		self.countryName = [infoDic objectForKey:WY_COUNTRY_NAME];
		self.countryDescription = [infoDic objectForKey:WY_COUNTRY_DES];
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
