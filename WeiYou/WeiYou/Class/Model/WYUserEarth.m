//
//  WYUserEarth.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserEarth.h"

@implementation WYUserEarth
@synthesize corSysEarth = _corSysEarth;
@synthesize userContinentsArray = _userContinentsArray;

// -------



#pragma -- init
- (id)initWithSysEarth:(WYSysEarth *)sysEarth {
	self = [super init];
	if (self) {
		_corSysEarth = sysEarth;
        self.userContinentsArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}



@end
