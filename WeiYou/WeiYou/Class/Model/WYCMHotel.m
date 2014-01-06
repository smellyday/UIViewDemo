//
//  WYCMHotel.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMHotel.h"
#import "WYCMTripDay.h"
#import "consts.h"


@implementation WYCMHotel

@dynamic dateCheckIn;
@dynamic daysCount;
@dynamic hotelName;
@dynamic hotelAddress;
@dynamic tripDay;

- (void)prepareHotelInfoWith:(NSDictionary *)infoDic {
    
    self.hotelName = [infoDic objectForKey:WY_HOTEL_NAME];
    self.hotelAddress = [infoDic objectForKey:WY_HOTEL_ADDRESS];
    
}

@end
