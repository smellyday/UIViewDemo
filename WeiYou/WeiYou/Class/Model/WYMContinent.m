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
@synthesize parentID = _parentID;
@synthesize level = _level;
@synthesize continentName = _continentName;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		_continentID = [infoDic objectForKey:WY_CONTINENT_ID];
		_parentID = [infoDic objectForKey:WY_CONTINENT_PARENT_ID];
		_level = [infoDic objectForKey:WY_SPOT_LEVEL];
		_continentName = [infoDic objectForKey:WY_CONTINENT_NAME];
	}
	return self;
}

- (NSDictionary *)transferToDic {
    return nil;
}

- (NSArray *)getAllCountries {
	return nil;
}

@end
