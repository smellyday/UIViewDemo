//
//  WYMContinent.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMContinent.h"
#import "consts.h"

@implementation WYMContinent
@synthesize continentType = _continentType;
@synthesize continentName = _continentName;
@synthesize continentDescription = _continentDescription;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.continentID = [infoDic objectForKey:WY_CONTINENT_ID];
		self.continentName = [infoDic objectForKey:WY_CONTINENT_NAME];
		self.continentDescription = [infoDic objectForKey:WY_CONTINENT_DES];
	}
	return self;
}

- (NSArray *)getAllCountries {
	return nil;
}

@end
