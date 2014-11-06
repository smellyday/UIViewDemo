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

- (id)initWithSysEarth:(WYSysEarth *)sysEarth {
	self = [super init];
	if (self) {
		self.corSysEarth = sysEarth;
        self.continentsArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}

@end
