//
//  WYShiButton.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYShiButton.h"

@implementation WYShiButton
@synthesize sysCity = _sysCity;
@synthesize userCity = _userCity;

- (id)initButtonWithCity:(WYSysCity *)city atIndex:(int)index {
	self = [super initButtonWithNodeName:city.nodeName atIndex:index];
	if (self) {
		_sysCity = city;
	}
	
	return self;
}

@end
