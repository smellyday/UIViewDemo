//
//  WYUserTripAgent.m
//  WeiYou
//
//  Created by zhangpan on 14-8-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserTripAgent.h"

@implementation WYUserTripAgent
@synthesize userTrips = _userTrips;


- (NSMutableArray *)userTrips {
    if (!_userTrips) {
        _userTrips = [NSMutableArray arrayWithCapacity:10];
    }
    
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

- (void)addUserTripsObject:(WYMTrip *)mTrip {
    
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
