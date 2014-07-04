//
//  WYMProvince.m
//  WeiYou
//
//  Created by owen on 7/4/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYMProvince.h"
#import "consts.h"

@implementation WYMProvince
@synthesize provinceID = _provinceID;
@synthesize provinceName = _provinceName;
@synthesize provinceDescription = _provinceDescription;

- (id)initWithProvinceInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.provinceID = [infoDic objectForKey:WY_PROVINCE_ID];
		self.provinceName = [infoDic objectForKey:WY_PROVINCE_NAME];
		self.provinceDescription = [infoDic objectForKey:WY_PROVINCE_DES];
	}
	return self;
}

- (NSArray *)getAllCities {
	return nil;
}

@end
