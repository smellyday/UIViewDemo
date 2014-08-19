//
//  WYSysContinent.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysContinent.h"
#import "WYSysNation.h"

@implementation WYSysContinent

- (id)initContinentWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
		NSArray *nationsArr = [infoDic objectForKey:@"countries"];
        for (NSDictionary *infoDic in nationsArr) {
            WYSysNation *nation = [[WYSysNation alloc] initNationWithInfo:infoDic];
            nation.pSysNode = self;
            [_childArray addObject:nation];
        }
	}
	
	return self;
}

@end
