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

- (id)initUserTripAgent {
    self = [super init];
    if (self) {
        _userTrips = [NSMutableArray arrayWithCapacity:10];
        NSArray *tripInfoDics = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
        for (NSDictionary *infoDic in tripInfoDics) {
            WYMTrip *mt = [[WYMTrip alloc] initWithTripInfoDic:infoDic];
            [_userTrips addObject:mt];
        }
    }
    
    return self;
}

- (NSMutableArray *)userTrips {
    NSAssert(_userTrips != nil, @"_userTrips should not be nil, Now");
    
    return _userTrips;
}

- (NSInteger)countOfUserTrips {
    return [self.userTrips count];
}


- (WYMTrip *)objectInUserTripsAtIndex:(NSUInteger)index {
    return [self.userTrips objectAtIndex:index];
}

- (NSArray *)userTripsAtIndexes:(NSIndexSet *)indexes {
    return [self.userTrips objectsAtIndexes:indexes];
}

- (void)insertObject:(WYMTrip *)mTrip inUserTripsAtIndex:(NSUInteger)index {
    
}

- (void)insertUserTrips:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    
}

- (void)removeObjectFromUserTripsAtIndex:(NSUInteger)index {
    
}

- (void)removeUserTripsAtIndexes:(NSIndexSet *)indexes {
    
}

- (void)removeUserTripsObject:(WYMTrip *)mTrip {
    
}

- (void)replaceObjectInUserTripsAtIndex:(NSUInteger)index withObject:(WYMTrip *)object {
	[_userTrips replaceObjectAtIndex:index withObject:object];
}

- (void)replaceUserTripsAtIndexes:(NSIndexSet *)indexes withUserTrips:(NSArray *)array {
	[_userTrips replaceObjectsAtIndexes:indexes withObjects:array];
}


@end
