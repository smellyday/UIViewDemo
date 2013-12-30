//
//  WYCMTripDay.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMTraffic, WYCMTrip;

@interface WYCMTripDay : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * trip_dayth;
@property (nonatomic, retain) WYCMTrip *trip;
@property (nonatomic, retain) NSSet *continents;
@property (nonatomic, retain) NSSet *traffics;
@property (nonatomic, retain) NSSet *hotels;
@end

@interface WYCMTripDay (CoreDataGeneratedAccessors)

- (void)addContinentsObject:(NSManagedObject *)value;
- (void)removeContinentsObject:(NSManagedObject *)value;
- (void)addContinents:(NSSet *)values;
- (void)removeContinents:(NSSet *)values;

- (void)addTrafficsObject:(WYCMTraffic *)value;
- (void)removeTrafficsObject:(WYCMTraffic *)value;
- (void)addTraffics:(NSSet *)values;
- (void)removeTraffics:(NSSet *)values;

- (void)addHotelsObject:(NSManagedObject *)value;
- (void)removeHotelsObject:(NSManagedObject *)value;
- (void)addHotels:(NSSet *)values;
- (void)removeHotels:(NSSet *)values;

@end
