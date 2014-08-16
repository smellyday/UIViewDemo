//
//  WYSysContinent.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysContinent.h"

@implementation WYSysContinent
@synthesize pSysEarth = _pSysEarth;

- (id)initContinentWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
		self.pSysEarth = nil;
	}
	
	return self;
}

@end
