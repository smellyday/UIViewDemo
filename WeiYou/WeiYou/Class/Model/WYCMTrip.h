//
//  WYCMTrip.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMPrepareList;

@interface WYCMTrip : NSManagedObject

@property (nonatomic, retain) NSNumber *tripIndex;
@property (nonatomic, retain) NSString * tripName;
@property (nonatomic, retain) NSString * tripDescription;
@property (nonatomic, retain) NSDate * tripBeginDate;
@property (nonatomic, retain) NSData * tripMainImageData;
@property (nonatomic, retain) NSSet *tripDays;
@property (nonatomic, retain) WYCMPrepareList *tripPrepareList;
@end

@interface WYCMTrip (CoreDataGeneratedAccessors)

- (void)addTripDaysObject:(NSManagedObject *)value;
- (void)removeTripDaysObject:(NSManagedObject *)value;
- (void)addTripDays:(NSSet *)values;
- (void)removeTripDays:(NSSet *)values;

- (void)prepareTripWithInfo:(NSDictionary *)infoDic;

@end
