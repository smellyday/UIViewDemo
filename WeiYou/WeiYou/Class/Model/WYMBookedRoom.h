//
//  WYMBookedRoom.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMRoom.h"

@interface WYMBookedRoom : WYMRoom {
	NSNumber *_roomCount;
}

@property (nonatomic, strong) NSNumber *roomCount;

- (id)initWithBookedRoomInfoDic:(NSDictionary *)infoDic;

@end
