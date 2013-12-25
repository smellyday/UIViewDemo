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
		self.hotelName = [infoDic objectForKey:WY_HOTEL_NAME];
		self.hotelAddress = [infoDic objectForKey:WY_HOTEL_ADDRESS];
		
		self.hotelPhonesArray = [infoDic objectForKey:WY_HOTEL_PHONES];
		self.hotelImageArray = [infoDic objectForKey:WY_HOTEL_IMAGES];
		
		NSMutableArray *hotelRoomsArr = [NSMutableArray arrayWithCapacity:10];
		for (NSDictionary *roomDic in [infoDic objectForKey:WY_HOTEL_ROOMS]) {
			WYMBookedRoom *bookedRoom = [[WYMBookedRoom alloc] initWithBookedRoomInfoDic:roomDic];
			[hotelRoomsArr addObject:bookedRoom];
		}
		self.hotelRoomsArray = hotelRoomsArr;
	}
	return self;
}

@end
