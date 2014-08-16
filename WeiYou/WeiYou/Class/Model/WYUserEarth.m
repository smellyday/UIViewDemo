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
	self = [super initWithSysUserNode:sysEarth];
	if (self) {
		_corSysEarth = sysEarth;
	}
	
	return self;
}

@end
