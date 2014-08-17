//
//  WYUserDestinations.m
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserDestinations.h"
#import "WYUserContinent.h"
#import "WYUserNation.h"
#import "WYUserCity.h"
#import "consts.h"

@implementation WYUserDestinations
@synthesize userEarth = _userEarth;

- (id)initUserDestinationsWithSysEarth:(WYSysEarth *)sysEarth {
	self = [super init];
	if (self) {
		_userEarth = [[WYUserEarth alloc] initWithSysUserNode:sysEarth];
	}
	
	return self;
}

- (NSArray *)getUserAllContinents {
	return (NSArray *)_userEarth.childArray;
}

- (NSArray *)getUserAllNations {
	NSMutableArray *allUserNations = [NSMutableArray arrayWithCapacity:10];
	NSArray *allUserContinents = [self getUserAllContinents];
	for (WYUserContinent *userContinent in allUserContinents) {
		[allUserNations addObjectsFromArray:userContinent.childArray];
	}
	
	return (NSArray *)allUserNations;
}

- (NSArray *)getUserNationsInContinentWithID:(NSInteger)continentID {
	NSArray *allUserContinents = [self getUserAllContinents];
	for (WYUserContinent *userContinent in allUserContinents) {
		if (userContinent.corSysContinent.mID == continentID) {
			return (NSArray *)userContinent.childArray;
		}
	}
	
	return nil;
}

- (NSArray *)getUserNationsInContinent:(WYUserContinent *)continent {
	return [self getUserNationsInContinentWithID:continent.corSysContinent.mID];
}

- (NSArray *)getUserAllCities {
	NSMutableArray *allUserCities = [NSMutableArray arrayWithCapacity:10];
	NSArray *allUserNations = [self getUserAllNations];
	for (WYUserNation *userNation in allUserNations) {
		[allUserCities addObjectsFromArray:userNation.childArray];
	}
	
	return (NSArray *)allUserCities;
}

- (NSArray *)getUserCitiesInNationWithID:(NSInteger)nationID {
	NSArray *allUserNations = [self getUserAllNations];
	for (WYUserNation *userNation in allUserNations) {
		if (userNation.corSysNation.mID == nationID) {
			
			for (WYUserCity *city in userNation.childArray) {
				mlog(@"~~~~~ city : %@", city.corSysCity.nodeName);
			}
			
			return (NSArray *)userNation.childArray;
		}
	}
	
	return nil;
}

- (NSArray *)getUserCitiesInNation:(WYUserNation *)nation {
	return [self getUserCitiesInNationWithID:nation.corSysNation.mID];
}

- (void)addUserNode:(WYUserNode **)userNode {
	if ((*userNode).corSysNode.pSysNode.mID == 0) {
		int count = 0;
		for (; count < [_userEarth.childArray count]; count++) {
			WYUserContinent *node = [_userEarth.childArray objectAtIndex:count];
			if ((*userNode).corSysNode.mID == node.corSysNode.mID) {
				(*userNode) = node;
				return;
			}
		}
		if (count >= [_userEarth.childArray count]) {
			(*userNode).pUserNode = _userEarth;
			[_userEarth.childArray addObject:(*userNode)];
		}
		
		return;
	}
	
	if ((*userNode).pUserNode) {
		[(*userNode).pUserNode.childArray addObject:(*userNode).pUserNode];
	} else {
		Class NodeClass = UserNodeClass((*userNode).corSysNode.pSysNode.nodeType);
		id parentUserNode = [[NodeClass alloc] initWithSysUserNode:(*userNode).corSysNode.pSysNode];
		[self addUserNode:&parentUserNode];
		(*userNode).pUserNode = parentUserNode;
		[[parentUserNode childArray] addObject:(*userNode)];
	}
}

- (void)addContinent:(WYUserContinent **)nContinent {
	int count = 0;
	for (; count < [_userEarth.childArray count]; count++) {
		WYUserContinent *node = [_userEarth.childArray objectAtIndex:count];
		if ((*nContinent).corSysNode.mID == node.corSysNode.mID) {
			(*nContinent) = node;
			return;
		}
	}
	if (count >= [_userEarth.childArray count]) {
		(*nContinent).pUserNode = _userEarth;
		[_userEarth.childArray addObject:(*nContinent)];
	}
}

- (void)addNation:(WYUserNation **)nNation {
	
	NSArray *allUserNations = [self getUserAllNations];
	for (WYUserNation *nation in allUserNations) {
		if (nation.corSysNation.mID == (*nNation).corSysNation.mID) {
			(*nNation) = nation;
			return;
		}
	}
	
	WYUserContinent *parentContinent = [[WYUserContinent alloc] initWithSysContinent:(*nNation).corSysNation.pSysNode];
	[self addContinent:&parentContinent];
	(*nNation).pUserNode = parentContinent;
	[parentContinent.childArray addObject:(*nNation)];
}

- (void)addCity:(WYUserCity **)nCity {
	
	NSArray *allUserCities = [self getUserAllCities];
	for (WYUserCity *city in allUserCities) {
		if (city.corSysCity.mID == (*nCity).corSysCity.mID) {
			(*nCity) = city;
			return;
		}
	}
	
	WYUserNation *parentNation = [[WYUserNation alloc] initWithSysNation:(*nCity).corSysCity.pSysNode];
	[self addNation:&parentNation];
	(*nCity).pUserNode = parentNation;
	[parentNation.childArray addObject:(*nCity)];
}

- (void)delUserNode:(WYUserNode **)userNode {
	WYUserNode *parentNode = (*userNode).pUserNode;
	
	if (!parentNode) {
		return;
	}
	
	mlog(@"got here?");
	[parentNode.childArray removeObject:(*userNode)];
	if ([parentNode.childArray count] == 0) {
		[self delUserNode:&parentNode];
	}
	
	(*userNode).pUserNode = nil;
}










@end
