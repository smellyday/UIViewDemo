//
//  WYCMTraffic.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WYCMTraffic : NSManagedObject

@property (nonatomic, retain) NSNumber * trafficType;
@property (nonatomic, retain) NSDate * takeOffTime;
@property (nonatomic, retain) NSString * departurePlace;
@property (nonatomic, retain) NSString * destinationPlace;
@property (nonatomic, retain) NSNumber * trafficPrice;
@property (nonatomic, retain) NSString * flightNumberStr;
@property (nonatomic, retain) NSString * trainNumberStr;
@property (nonatomic, retain) NSManagedObject *tripDay;

@end
