//
//  WYSysNation.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNation.h"

@implementation WYSysNation
@synthesize pSysContinent = _pSysContinent;

- (id)initNationWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
		self.pSysContinent = nil;
	}
	
	return self;
}

@end
