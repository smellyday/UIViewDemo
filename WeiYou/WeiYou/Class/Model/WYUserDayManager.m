//
//  WYUserDayManager.m
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYUserDayManager.h"
#import "NSDate+Utilities.h"

@implementation WYUserDayManager
@synthesize daysArray = _daysArray;

//------------------------



#pragma -- init
- (id)initNewUserDayManager {
    
    self = [super init];
    if (self) {
        self.daysArray = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
    
}



#pragma -- operate
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth {
    
    NSAssert(dayth == 0, @"The dayth of the spot can not be 0");
    
    WYTripDay *theTripDay = [_daysArray objectAtIndex:dayth-1];
    [theTripDay addSpot:spot];
    
}

- (void)delSpot:(WYUserSpot *)spot {
    
    NSAssert(spot.todayDayth == 0, @"The dayth of the spot can not be 0");
    
    WYTripDay *theTripDay = [_daysArray objectAtIndex:spot.todayDayth-1];
    [theTripDay delSpot:spot];

}

- (void)delSpotInCity:(WYUserCity *)city {
    
    for (WYTripDay *theTripDay in _daysArray) {
        for (WYUserSpot *spot in theTripDay.spotsArray) {
            if (spot.corSysSpot.sysParentID == city.corSysCity.sysMID) {
                [theTripDay delSpot:spot];
            }
        }
    }

}

- (void)delSpotInNation:(WYUserNation *)nation {
    
}

- (void)addOneTripDay:(WYTripDay *)tripDay {
    
}

- (void)delOneTripDay:(WYTripDay *)tripDay {
    
}

- (void)moveOneTripDayFromDate1:(NSDate *)date1 toDate2:(NSDate *)date2 {
    
}



#pragma -- KVC
- (NSUInteger)countOfDaysArray {
    return [_daysArray count];
}

- (WYTripDay *)objectInDaysArrayAtIndex:(NSUInteger)index {
    return [_daysArray objectAtIndex:index];
}

- (NSArray *)daysArrayAtIndexes:(NSIndexSet *)indexes {
    return [_daysArray objectsAtIndexes:indexes];
}

- (void)insertObject:(WYTripDay *)tripDayObj inDaysArrayAtIndex:(NSUInteger)index {
    [_daysArray insertObject:tripDayObj atIndex:index];
}

- (void)insertDaysArray:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    [_daysArray insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromDaysArrayAtIndex:(NSUInteger)index {
    [_daysArray removeObjectAtIndex:index];
}

- (void)removeDaysArrayAtIndexes:(NSIndexSet *)indexes {
    [_daysArray removeObjectsAtIndexes:indexes];
}

- (void)removeDaysArrayObject:(WYTripDay *)object {
    [_daysArray removeObject:object];
}

- (void)replaceDaysArrayAtIndexes:(NSIndexSet *)indexes withDaysArray:(NSArray *)array {
    [_daysArray replaceObjectsAtIndexes:indexes withObjects:array];
}

- (void)replaceObjectInDaysArrayAtIndex:(NSUInteger)index withObject:(WYTripDay *)object {
    [_daysArray replaceObjectAtIndex:index withObject:object];
}








































































@end
