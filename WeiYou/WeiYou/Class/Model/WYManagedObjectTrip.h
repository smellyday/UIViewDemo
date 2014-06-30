//
//  WYManagedObjectTrip.h
//  WeiYou
//
//  Created by zhangpan on 14-6-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYManagedObjectTripDay;

@interface WYManagedObjectTrip : NSManagedObject

@property (nonatomic, retain) NSString * tripName;
@property (nonatomic, retain) NSString * tripID;
@property (nonatomic, retain) NSNumber * tripIndex;
@property (nonatomic, retain) NSDate * tripBeginDate;
@property (nonatomic, retain) NSDate * tripEndDate;
@property (nonatomic, retain) NSString * tripDes;
@property (nonatomic, retain) WYManagedObjectTripDay *tripDays;

@end
