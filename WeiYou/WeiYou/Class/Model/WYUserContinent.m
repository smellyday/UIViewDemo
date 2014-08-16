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

- (id)initWithSysContinent:(WYSysContinent *)sysContinent {
	self = [super initWithSysUserNode:sysContinent];
	if (self) {
		_corSysContinent = sysContinent;
		self.pUserNode = nil;
	}
	
	return self;
}

@end
