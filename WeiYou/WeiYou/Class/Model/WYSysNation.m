//
//  WYSysNation.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNation.h"

@implementation WYSysNation
@synthesize sysParentContinent = _sysParentContinent;

- (id)initNationWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
        
	}
	
	return self;
}

- (NSString *)fetchNationBriefDescription {
    return nil;
}

- (NSArray *)fetchNationImages {
    return nil;
}

- (NSArray *)loadSysAllCitiesInTheNation {
    return nil;
}

@end
