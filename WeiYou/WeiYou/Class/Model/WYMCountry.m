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

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
        _ID = [infoDic objectForKey:WY_PLACE_ID];
        _parentID = [infoDic objectForKey:WY_PLACE_PARENT_ID];
        _name = [[infoDic objectForKey:WY_PLACE_NAME] objectForKey:WY_NAME_ZHCH];
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
