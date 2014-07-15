//
//  WYMSpot.m
//  WeiYou
//
//  Created by owen on 7/3/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYMSpot.h"
#import "WYMCity.h"
#import "WYMProvince.h"
#import "WYMCountry.h"
#import "WYMContinent.h"
#import "consts.h"

@implementation WYMSpot
@synthesize spotID = _spotID;
@synthesize spotOrder = _spotOrder;
@synthesize spotName = _spotName;
@synthesize spotAddress = _spotAddress;
@synthesize spotInfo = _spotInfo;
@synthesize spotWebsiteArray = _spotWebsiteArray;
@synthesize spotImageURLArray = _spotImageURLArray;
@synthesize spotCity = _spotCity;
@synthesize spotProvince = _spotProvince;
@synthesize spotCountry = _spotCountry;
@synthesize spotContinent = _spotContinent;

- (id)initWithSpotInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.spotID = [infoDic objectForKey:WY_SPOT_ID];
		self.spotOrder = [infoDic objectForKey:WY_SPOT_ORDER];
		self.spotName = [infoDic objectForKey:WY_SPOT_NAME];
		self.spotAddress = [infoDic objectForKey:WY_SPOT_ADDRESS];
		self.spotInfo = [infoDic objectForKey:WY_SPOT_INFO];
		
		self.spotWebsiteArray = [infoDic objectForKey:WY_SPOT_WEBSITE_ARR];
		self.spotImageURLArray = [infoDic objectForKey:WY_SPOT_IMAGE_URL_ARR];
		
		self.spotCity = [[WYMCity alloc] initWithCityInfoDic:[infoDic objectForKey:WY_SPOT_CITY]];
		self.spotProvince = [[WYMProvince alloc] initWithProvinceInfoDic:[infoDic objectForKey:WY_SPOT_PROVINCE]];
		self.spotCountry = [[WYMCountry alloc] initWithCountryInfoDic:[infoDic objectForKey:WY_SPOT_COUNTRY]];
		self.spotContinent = [[WYMContinent alloc] initWithContinentInfoDic:[infoDic objectForKey:WY_SPOT_CONTINENT]];
	}
	return self;
}

- (NSDictionary *)transferToDic {
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[infoDic setObject:_spotID forKey:WY_SPOT_ID];
	[infoDic setObject:_spotOrder forKey:WY_SPOT_ORDER];
	[infoDic setObject:_spotName forKey:WY_SPOT_NAME];
	[infoDic setObject:_spotAddress forKey:WY_SPOT_ADDRESS];
	[infoDic setObject:_spotInfo forKey:WY_SPOT_ID];
	[infoDic setObject:_spotWebsiteArray forKey:WY_SPOT_WEBSITE_ARR];
	[infoDic setObject:_spotImageURLArray forKey:WY_SPOT_IMAGE_URL_ARR];
    
    [infoDic setObject:[_spotCity transferToDic] forKey:WY_SPOT_CITY];
    [infoDic setObject:[_spotProvince transferToDic] forKey:WY_SPOT_PROVINCE];
    [infoDic setObject:[_spotCountry transferToDic] forKey:WY_SPOT_COUNTRY];
    [infoDic setObject:[_spotContinent transferToDic] forKey:WY_SPOT_CONTINENT];
    
    return nil;
}

@end
