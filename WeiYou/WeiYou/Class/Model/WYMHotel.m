//
//  WYMHotel.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMHotel.h"
#import "WYMBookedRoom.h"
#import "consts.h"

@implementation WYMHotel
@synthesize hotelName = _hotelName;
@synthesize hotelAddress = _hotelAddress;
@synthesize hotelPhonesArray = _hotelPhonesArray;
@synthesize hotelImageArray = _hotelImageArray;
@synthesize hotelRoomsArray = _hotelRoomsArray;


- (id)initWithHotelInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		
	}
	return self;
}

@end
