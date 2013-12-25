//
//  WYMRoom.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMRoom.h"
#import "consts.h"

@implementation WYMRoom
@synthesize roomTypeName = _roomTypeName;
@synthesize roomCapacity = _roomCapacity;
@synthesize roomDimension = _roomDimension;
@synthesize roomFloor = _roomFloor;
@synthesize roomPrice = _roomPrice;

- (id)initWithRoomInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.roomTypeName = [infoDic objectForKey:WY_ROOM_TYPE_NAME];
		self.roomCapacity = [infoDic objectForKey:WY_ROOM_CAPACITY];
		self.roomDimension = [infoDic objectForKey:WY_ROOM_DIMENSION];
		self.roomFloor = [infoDic objectForKey:WY_ROOM_FLOOR];
		self.roomPrice = [infoDic objectForKey:WY_ROOM_PRICE];
	}
	return self;
}

@end
