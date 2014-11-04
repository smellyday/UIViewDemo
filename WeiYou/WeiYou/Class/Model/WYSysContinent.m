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
@synthesize sysParentEarth = _sysParentEarth;
@synthesize continentInfoDic = _continentInfoDic;

- (id)initContinentWithInfo:(NSDictionary *)infoDic {
	self = [super initNodeWithInfo:infoDic];
	if (self) {
        self.continentInfoDic = infoDic;
        [self loadSysAllNationsInTheContinent];
	}
	
	return self;
}


- (NSString *)fetchContinentBriefDescription {
    return nil;
}

- (NSArray *)fetchContinentImages {
    return nil;
}

#pragma -- private method.
- (void)loadSysAllNationsInTheContinent {
    NSArray *nationsArr = [_continentInfoDic objectForKey:WY_NODE_COUNTRIES];
    for (NSDictionary *nationInfo in nationsArr) {
        WYSysNation *nation = [[WYSysNation alloc] initNationWithInfo:nationInfo];
        nation.sysParentContinent = self;
        [_sysChildArray addObject:nation];
    }
}

@end
