//
//  WYUserTripAgent.m
//  WeiYou
//
//  Created by zhangpan on 14-8-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserTripAgent.h"
#import "consts.h"

@implementation WYUserTripAgent
@synthesize userTrips = _userTrips;
@synthesize focusingTrip = _focusingTrip;

//-------------------



#pragma -- init
- (id)initUserTripAgent {
    self = [super init];
    if (self) {
        _userTrips = [NSMutableArray arrayWithCapacity:10];
//        NSArray *tripInfoDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
//        for (NSDictionary *infoDic in tripInfoDics) {
//            WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
//            [_userTrips addObject:mt];
//        }
    }
    
    return self;
}

+ (id)sharedUserTripAgent {
    static WYUserTripAgent *sharedUserTripAgent = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserTripAgent = [[self alloc] initUserTripAgent];
    });
    
    return sharedUserTripAgent;
}



#pragma -- operate
- (void)focusOnUserTrip:(WYUserTrip *)userTrip {
    _focusingTrip = userTrip;
}



#pragma -- KVC
- (NSMutableArray *)userTrips {
    NSAssert(_userTrips != nil, @"_userTrips should not be nil, Now");
    
    return _userTrips;
}

- (NSInteger)countOfUserTrips {
    return [self.userTrips count];
}


- (WYUserTrip *)objectInUserTripsAtIndex:(NSUInteger)index {
    return [self.userTrips objectAtIndex:index];
}

- (NSArray *)userTripsAtIndexes:(NSIndexSet *)indexes {
    return [self.userTrips objectsAtIndexes:indexes];
}

- (void)insertObject:(WYUserTrip *)mTrip inUserTripsAtIndex:(NSUInteger)index {
    [_userTrips insertObject:mTrip atIndex:index];
}

- (void)insertUserTrips:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    [_userTrips insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromUserTripsAtIndex:(NSUInteger)index {
    [_userTrips removeObjectAtIndex:index];
}

- (void)removeUserTripsAtIndexes:(NSIndexSet *)indexes {
    [_userTrips removeObjectsAtIndexes:indexes];
}

- (void)removeUserTripsObject:(WYUserTrip *)mTrip {
    [_userTrips removeObject:mTrip];
}

- (void)replaceObjectInUserTripsAtIndex:(NSUInteger)index withObject:(WYUserTrip *)object {
	[_userTrips replaceObjectAtIndex:index withObject:object];
}

- (void)replaceUserTripsAtIndexes:(NSIndexSet *)indexes withUserTrips:(NSArray *)array {
	[_userTrips replaceObjectsAtIndexes:indexes withObjects:array];
}
























































@end
