//
//  WYUserContinent.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserContinent.h"

@implementation WYUserContinent
@synthesize corSysContinent = _corSysContinent;
@synthesize userParentEarth = _userParentEarth;
@synthesize userNationsArray = _userNationsArray;

// --------------------



#pragma -- init
- (id)initWithSysContinent:(WYSysContinent *)sysContinent {
	self = [super init];
	if (self) {
		_corSysContinent = sysContinent;
        self.userParentEarth = nil;
        self.userNationsArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}

@end
