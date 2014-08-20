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
#import "WYSysCity.h"
#import "consts.h"


@interface WYSysDestinations (private)

- (void)loadAllNations;

@end

@implementation WYSysDestinations
@synthesize sysEarth = _sysEarth;
@synthesize delegate;


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

- (void)getSysCitiesInNationWithID:(NSInteger)nationID {
	
    NSAssert(NO, @"Do not user this function by now");
	
}

- (void)getSysCitiesInNation:(NSTimer *)timer {
    NSAssert([timer.userInfo isKindOfClass:[WYSysNation class]], @"timer.userInfo must be WYSysNation Class");
    
    WYSysNation *nation = (WYSysNation *)timer.userInfo;
    NSAssert(nation.pSysNode != nil, @"nation's pSysNode should not be nil");
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"testCity" ofType:@"plist"];
    NSArray *infoArr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *infoDic in infoArr) {
        WYSysCity *mcity = [[WYSysCity alloc] initCityWithInfo:infoDic];
        mcity.pSysNode = nation;
        [nation.childArray addObject:mcity];
    }
	
    [delegate destigationsAgnetGotCitiesArrayInNation:(WYSysNation *)timer.userInfo];
}

- (void)requestSysCitiesInNation:(WYSysNation *)nation {
    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(getSysCitiesInNation:) userInfo:nation repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
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
