//
//  WYCMTrip.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMTrip.h"
#import "WYCMTripDay.h"
#import "WYCMPrepareList.h"
#import "WYCoreDataEngine.h"
#import "consts.h"


@implementation WYCMTrip

@dynamic tripName;
@dynamic tripDescription;
@dynamic tripBeginDate;
@dynamic tripMainImageData;
@dynamic tripDays;
@dynamic tripPrepareList;


- (void)initTripWithInfo:(NSDictionary *)infoDic {
    
    self.tripName = [infoDic objectForKey:WY_TRIP_NAME];
    self.tripDescription = [infoDic objectForKey:WY_TRIP_DES];
    self.tripMainImageData = [infoDic objectForKey:WY_TRIP_MAIN_IMAGE];
    self.tripBeginDate = [infoDic objectForKey:WY_TRIP_BEGIN_DATE];

    NSArray *daysDicArr = [infoDic objectForKey:WY_TRIP_DAYS];
    for (NSDictionary *dic in daysDicArr) {
        WYCMTripDay *tripDay = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMTripDay" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        tripDay.trip = self;
        [tripDay initTripDayWithInfo:dic];
    }
}

@end
