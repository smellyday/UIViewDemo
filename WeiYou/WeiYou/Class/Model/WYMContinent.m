//
//  WYMContinent.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMContinent.h"
#import "WYMCountry.h"
#import "consts.h"

@implementation WYMContinent
@synthesize continentType = _continentType;
@synthesize continentName = _continentName;
@synthesize continentDes = _continentDes;
@synthesize countryArray = _countryArray;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
//		self.continentName = [infoDic objectForKey:WY_CONTINENT_NAME];
		self.continentDes = [infoDic objectForKey:WY_CONTINENT_DES];
		
		NSMutableArray *countryArr = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *cnyDic in [infoDic objectForKey:WY_CONTINENT_COUNTRIES]) {
			WYMCountry *country = [[WYMCountry alloc] initWithCountryInfoDic:cnyDic];
			[countryArr addObject:country];
		}
		self.countryArray = countryArr;
	}
	return self;
}

@end
