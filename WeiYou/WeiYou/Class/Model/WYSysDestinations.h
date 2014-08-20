//
//  WYSysDestinations.h
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysEarth.h"
#import "WYSysContinent.h"
#import "WYSysNation.h"
#import "WYSysCity.h"


@protocol DestinationsDataDelegate

@optional
- (void)destigationsAgnetGotCitiesArrayInNation:(WYSysNation *)nation;

@end



@interface WYSysDestinations : NSObject {
	WYSysEarth *_sysEarth;
}

@property (nonatomic, readonly) WYSysEarth *sysEarth;
@property (nonatomic) id<DestinationsDataDelegate> delegate;

- (id)initSysDestinations;
- (void)addNode:(WYSysNode *)cNode to:(WYSysNode *)pNode;
- (void)delNode:(WYSysNode *)cNode from:(WYSysNode *)pNode;

- (NSArray *)getSysAllContinents;
- (NSArray *)getSysNationsInContinentWithID:(NSInteger)continentID;
- (NSArray *)getSysNationsInContinent:(WYSysContinent *)continent;

- (void)getSysCitiesInNationWithID:(NSInteger)nationID;
- (void)getSysCitiesInNation:(NSTimer *)timer;
- (void)requestSysCitiesInNation:(WYSysNation *)nation;

@end
