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

- (id)initWithSysCity:(WYSysCity *)sysCity {
	self = [super initWithSysUserNode:sysCity];
	if (self) {
		_corSysCity = sysCity;
		self.pUserNode = nil;
	}
	
	return self;
}

@end
