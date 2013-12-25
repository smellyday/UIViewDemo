//
//  WYMBookedRoom.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMBookedRoom.h"
#import "consts.h"

@implementation WYMBookedRoom
@synthesize roomCount = _roomCount;

- (id)initWithBookedRoomInfoDic:(NSDictionary *)infoDic {
	self = [super initWithRoomInfoDic:infoDic];
	if (self) {
		self.roomCount = [infoDic objectForKey:WY_ROOM_COUNT];
	}
	return self;
}

@end
