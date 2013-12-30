//
//  WYCMHotel.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMTripDay;

@interface WYCMHotel : NSManagedObject

@property (nonatomic, retain) NSDate * dateCheckIn;
@property (nonatomic, retain) NSNumber * daysCount;
@property (nonatomic, retain) NSString * hotelName;
@property (nonatomic, retain) NSString * hotelAddress;
@property (nonatomic, retain) WYCMTripDay *tripDay;

@end
