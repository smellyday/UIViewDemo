//
//  WYMSpot.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMSpot.h"
#import "consts.h"

@implementation WYMSpot
@synthesize spotName = _spotName;

- (id)initWithSpotInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		NSNumber *typeNumber = [infoDic objectForKey:WY_SPOT_TYPE];
		if ([typeNumber intValue] == 1) {
			self.spotType = WYSpotScenic;
		} else if ([typeNumber intValue] == 2) {
			self.spotType = WYSpotFood;
		} else if ([typeNumber intValue] == 3) {
			self.spotType = WYSpotShopping;
		} else if ([typeNumber intValue] == 4) {
			self.spotType = WYSpotAcitivity;
		} else {
			self.spotType = WYSpotElse;
		}
		
		self.spotName = [infoDic objectForKey:WY_SPOT_NAME];
		self.spotAddress = [infoDic objectForKey:WY_SPOT_ADDRESS];
		self.spotInfo = [infoDic objectForKey:WY_SPOT_INFO];
		self.spotOpenTimeStr = [infoDic objectForKey:WY_SPOT_OPEN_TIME];
		self.trafficInfo = [infoDic objectForKey:WY_SPOT_TRAFFIC_INFO];
		self.admissionPrice = [[infoDic objectForKey:WY_SPOT_ADMISSION_PRICE] floatValue];
		self.spotImagesArray = [infoDic objectForKey:WY_SPOT_IMAGE_ARR];
		self.contactWaysArray = [infoDic objectForKey:WY_SPOT_CONTACT_WAYS];
		
	}
	return self;
}

@end
