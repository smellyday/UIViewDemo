//
//  WYUserCity.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserCity.h"

@implementation WYUserCity
@synthesize corSysCity = _corSysCity;
@synthesize userParentNation = _userParentNation;
@synthesize userSpotsArray = _userSpotsArray;

// ---------------



#pragma -- init
- (id)initWithSysCity:(WYSysCity *)sysCity {
	self = [super init];
	if (self) {
		_corSysCity = sysCity;
		self.userParentNation = nil;
        self.userSpotsArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}



#pragma -- operate


@end
