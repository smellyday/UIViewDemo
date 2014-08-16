//
//  WYSysCity.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysCity.h"

@implementation WYSysCity
@synthesize pSysNation = _pSysNation;

- (id)initCityWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
		self.pSysNation = nil;
	}
	
	return self;
}

@end
