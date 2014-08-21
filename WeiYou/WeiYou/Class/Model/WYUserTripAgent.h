//
//  WYUserTripAgent.h
//  WeiYou
//
//  Created by zhangpan on 14-8-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMTrip.h"

@interface WYUserTripAgent : NSObject {
    NSMutableArray *_userTrips;

}

@property (nonatomic, readonly) NSMutableArray *userTrips;

- (id)initUserTripAgent;

- (NSInteger)countOfUserTrips;
- (WYMTrip *)objectInUserTripsAtIndex:(NSUInteger)index;
- (NSArray *)userTripsAtIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(WYMTrip *)mTrip inUserTripsAtIndex:(NSUInteger)index;
- (void)insertUserTrips:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromUserTripsAtIndex:(NSUInteger)index;
- (void)removeUserTripsAtIndexes:(NSIndexSet *)indexes;
- (void)removeUserTripsObject:(WYMTrip *)mTrip;
- (void)replaceObjectInUserTripsAtIndex:(NSUInteger)index withObject:(WYMTrip *)object;
- (void)replaceUserTripsAtIndexes:(NSIndexSet *)indexes withUserTrips:(NSArray *)array;

//- (void)addUserTrips:(NSSet *)objects; // There is a bug in Apple.
@end
