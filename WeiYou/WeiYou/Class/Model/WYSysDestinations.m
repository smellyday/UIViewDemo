//
//  WYSysDestinations.m
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysDestinations.h"
#import "WYSysContinent.h"
#import "WYSysNation.h"


@interface WYSysDestinations (private)

- (void)loadAllNations;

@end

@implementation WYSysDestinations
@synthesize sysEarth = _sysEarth;


- (id)initSysDestinations {
	self = [super init];
	if (self) {
		_sysEarth = [[WYSysEarth alloc] initEarth];
		[self loadAllNations];
	}
	
	return self;
}

- (void)addNode:(WYSysNode *)cNode to:(WYSysNode *)pNode {
	int count = 0;
	for (; count < [pNode.childArray count]; count++) {
		WYSysNode *mSysNode = [pNode.childArray objectAtIndex:count];
		if (mSysNode.mID == cNode.mID) {
			break;
		}
	}
	
	if (count >= [pNode.childArray count]) {
		[pNode.childArray addObject:cNode];
	}
}

- (void)delNode:(WYSysNode *)cNode from:(WYSysNode *)pNode {

}

- (NSArray *)getSysAllContinents {
	return (NSArray *)_sysEarth.childArray;
}


- (NSArray *)getSysNationsInContinentWithID:(NSInteger)continentID {
	NSArray *allContinents = [self getSysAllContinents];
	for (WYSysContinent *sysContinent in allContinents) {
		if (sysContinent.mID == continentID) {
			return (NSArray *)sysContinent.childArray;
		}
	}
	
	return nil;
}

- (NSArray *)getSysNationsInContinent:(WYSysContinent *)continent {
	return [self getSysNationsInContinentWithID:continent.mID];
}

- (NSArray *)getSysCitiesInNationWithID:(NSInteger)nationID {
	
	
	
	return nil;
}

- (NSArray *)getSysCitiesInNation:(WYSysNation *)nation {
	
	NSMutableArray *allCities = [NSMutableArray arrayWithCapacity:10];
	
	NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[mutDic setObject:@"10002" forKey:@"id"];
	[mutDic setObject:@"208" forKey:@"parent_id"];
	[mutDic setObject:@{@"en":@"Beijing", @"zh-CN":@"北京"} forKey:@"name"];
	WYSysCity *mcity = [[WYSysCity alloc] initCityWithInfo:mutDic];
	mcity.pSysNode = nation;
	[allCities addObject:mcity];
	
	NSMutableDictionary *mutDic2 = [NSMutableDictionary dictionaryWithCapacity:10];
	[mutDic2 setObject:@"10003" forKey:@"id"];
	[mutDic2 setObject:@"208" forKey:@"parent_id"];
	[mutDic2 setObject:@{@"en":@"ShangHai", @"zh-CN":@"上海"} forKey:@"name"];
	WYSysCity *mcity2 = [[WYSysCity alloc] initCityWithInfo:mutDic2];
	mcity2.pSysNode = nation;
	[allCities addObject:mcity2];
	
	
	return allCities;
//	return [self getSysCitiesInNationWithID:nation.mID];
}

#pragma mark - private method.
- (void)loadAllNations {
    NSString *nationsPlistPath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"];
    NSArray *fileArr = [NSArray arrayWithContentsOfFile:nationsPlistPath];
    for (NSDictionary *infoDic in fileArr) {
        WYSysContinent *continent = [[WYSysContinent alloc] initContinentWithInfo:infoDic];
        [_sysEarth.childArray addObject:continent];
    }
}




@end
