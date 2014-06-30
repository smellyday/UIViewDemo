//
//  WYManagedObjectTripDay.h
//  WeiYou
//
//  Created by zhangpan on 14-6-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WYManagedObjectTripDay : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * tripID;
@property (nonatomic, retain) NSString * tripDayID;
@property (nonatomic, retain) NSNumber * dayth;

@end
