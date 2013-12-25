//
//  WYMBookedHotel.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMBookedHotel.h"
#import "consts.h"

@implementation WYMBookedHotel
@synthesize dateCheckIn = _dateCheckIn;
@synthesize dateCheckOut = _dateCheckOut;
@synthesize daysCount = _daysCount;

- (id)initWithBookedHoteInfoDic:(NSDictionary *)infoDic {
	self = [super initWithHotelInfoDic:infoDic];
	if (self) {
		self.dateCheckIn = [infoDic objectForKey:WY_HOTEL_CHECK_IN];
		self.dateCheckOut = [infoDic objectForKey:WY_HOTEL_CHECK_OUT];
		
	}
	return self;
}

@end
