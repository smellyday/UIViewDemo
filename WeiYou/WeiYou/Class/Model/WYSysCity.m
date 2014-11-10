//
//  WYSysCity.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysCity.h"

@implementation WYSysCity
@synthesize sysParentNation = _sysParentNation;

- (id)initCityWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
		
	}
	
	return self;
}

- (NSString *)fetchCityBriefDescription {
    return nil;
}

- (NSArray *)fetchCityImages {
    return nil;
}

- (void)loadSysAllSpotsInTheCity {
    
}

@end
