//
//  WYUserTripAgent.h
//  WeiYou
//
//  Created by zhangpan on 14-8-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserTrip.h"

@interface WYUserTripAgent : NSObject {
    NSMutableArray *_userTrips;
    WYUserTrip *_focusingTrip;
    
}

@property (nonatomic, readonly) NSMutableArray *userTrips;
@property (nonatomic, readonly) WYUserTrip *focusingTrip;


#pragma -- init
+ (id)sharedUserTripAgent;

#pragma -- operate
- (void)addNewUserTrip:(WYUserTrip *)userTrip;
- (void)focusOnUserTrip:(WYUserTrip *)userTrip;

#pragma -- KVC
- (NSInteger)countOfUserTrips;
- (WYUserTrip *)objectInUserTripsAtIndex:(NSUInteger)index;
- (NSArray *)userTripsAtIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(WYUserTrip *)mTrip inUserTripsAtIndex:(NSUInteger)index;
- (void)insertUserTrips:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromUserTripsAtIndex:(NSUInteger)index;
- (void)removeUserTripsAtIndexes:(NSIndexSet *)indexes;
- (void)removeUserTripsObject:(WYUserTrip *)mTrip;
- (void)replaceObjectInUserTripsAtIndex:(NSUInteger)index withObject:(WYUserTrip *)object;
- (void)replaceUserTripsAtIndexes:(NSIndexSet *)indexes withUserTrips:(NSArray *)array;
//- (void)addUserTrips:(NSSet *)objects; // There is a bug in Apple.


@end
