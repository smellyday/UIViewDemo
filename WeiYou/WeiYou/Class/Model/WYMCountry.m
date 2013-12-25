//
//  WYMCountry.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMCountry.h"
#import "WYMCity.h"
#import "consts.h"

@implementation WYMCountry
@synthesize countryName = _countryName;
@synthesize countryDes = _countryDes;
@synthesize cityArray = _cityArray;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.countryName = [infoDic objectForKey:WY_COUNTRY_NAME];
		self.countryDes = [infoDic objectForKey:WY_COUNTRY_DES];
		
		NSMutableArray *cityArr = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *ctyDic in [infoDic objectForKey:WY_COUNTRY_CITIES]) {
			WYMCity *city = [[WYMCity alloc] initWithCityInfoDic:ctyDic];
			[cityArr addObject:city];
		}
		self.cityArray = cityArr;
	}
	return self;
}

@end
