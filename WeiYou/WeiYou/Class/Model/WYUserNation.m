//
//  WYUserNation.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNation.h"

@implementation WYUserNation
@synthesize corSysNation = _corSysNation;
@synthesize userParentContinent = _userParentContinent;
@synthesize userCitiesArray = _userCitiesArray;

// -----------------------



#pragma -- init
- (id)initWithSysNation:(WYSysNation *)sysNation {
	self = [super init];
	if (self) {
		_corSysNation = sysNation;
		self.userParentContinent = nil;
        self.userCitiesArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}

@end
