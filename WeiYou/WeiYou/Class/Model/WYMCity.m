//
//  WYMCity.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMCity.h"
#import "WYMSpot.h"
#import "consts.h"

@implementation WYMCity
@synthesize cityName = _cityName;
@synthesize briefName = _briefName;
@synthesize cityDes = _cityDes;
@synthesize spotsArray = _spotsArray;

- (id)initWithCityName:(NSString *)name {
	self = [super init];
	if (self) {
		self.cityName = name;
		self.briefName = @"error";
	}
	return self;
}

- (id)initWithCityInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.cityName = [infoDic objectForKey:WY_CITY_NAME];
		self.cityDes = [infoDic objectForKey:WY_CITY_DES];
		self.briefName = [infoDic objectForKey:WY_CITY_BRIEF_NAME];
		
			//spots
		self.spotsArray = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *spotDic in [infoDic objectForKey:WY_SPOTS]) {
			WYMSpot *spot = [[WYMSpot alloc] initWithSpotInfoDic:spotDic];
			[self.spotsArray addObject:spot];
		}
	}
	return self;
}

@end
