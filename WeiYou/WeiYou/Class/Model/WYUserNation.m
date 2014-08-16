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

- (id)initWithSysNation:(WYSysNation *)sysNation {
	self = [super initWithSysUserNode:sysNation];
	if (self) {
		_corSysNation = sysNation;
		self.pUserNode = nil;
	}
	
	return self;
}

@end
