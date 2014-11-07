//
//  WYUserDayManager.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYTripDay.h"
#import "WYUserNation.h"
#import "WYUserCity.h"
#import "WYUserSpot.h"

@interface WYUserDayManager : NSObject {
    NSMutableArray *_daysArray; // _daysArray is an ordered list.
}

@property (nonatomic, readonly) NSMutableArray *daysArray;

#pragma -- init
- (id)initNewUserDayManager;
- (id)initUserDayManagerWithInfo:(NSDictionary *)infoDic;

#pragma -- operate
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth;

- (void)delAllSpotsWithSameID:(NSUInteger)spotID;
- (void)delSpot:(WYUserSpot *)spot fromDayth:(NSUInteger)dayth;
- (void)delAllSpotsInCity:(WYUserCity *)city;
- (void)delAllSpotsInNation:(WYUserNation *)nation;

- (void)addOneTripDay:(WYTripDay *)tripDay;
- (void)delOneTripDay:(WYTripDay *)tripDay;

- (void)moveOneTripDayFromDate1:(NSDate *)date1 toDate2:(NSDate *)date2;

#pragma -- KVC
- (NSUInteger)countOfDaysArray;
- (WYTripDay *)objectInDaysArrayAtIndex:(NSUInteger)index;
- (NSArray *)daysArrayAtIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(WYTripDay *)tripDayObj inDaysArrayAtIndex:(NSUInteger)index;
- (void)insertDaysArray:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromDaysArrayAtIndex:(NSUInteger)index;
- (void)removeDaysArrayAtIndexes:(NSIndexSet *)indexes;
- (void)removeDaysArrayObject:(WYTripDay *)object;
- (void)replaceDaysArrayAtIndexes:(NSIndexSet *)indexes withDaysArray:(NSArray *)array;
- (void)replaceObjectInDaysArrayAtIndex:(NSUInteger)index withObject:(WYTripDay *)object;


@end
