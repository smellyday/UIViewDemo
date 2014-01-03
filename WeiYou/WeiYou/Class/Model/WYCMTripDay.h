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

@interface WYCMTripDay : NSManagedObject {
    NSDate *_date;
    NSString *_dateStr;
    NSString *_weekDayStr;
    NSString *_dayTHStr;
}

@property (nonatomic, retain) NSNumber * dayth;
@property (nonatomic, retain) WYCMTrip *trip;
@property (nonatomic, retain) NSSet *continents;
@property (nonatomic, retain) NSSet *traffics;
@property (nonatomic, retain) NSSet *hotels;

//not core data
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *weekDayStr;
@property (nonatomic, strong) NSString *dayTHStr;

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

- (void)prepareTripDayWithInfo:(NSDictionary *)infoDic;
- (void)prepareTripDayInfo;

@end
