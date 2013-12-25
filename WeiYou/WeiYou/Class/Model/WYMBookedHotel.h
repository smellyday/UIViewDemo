//
//  WYMBookedHotel.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMHotel.h"

@interface WYMBookedHotel : WYMHotel {
	NSDate *_dateCheckIn;
	NSDate *_dateCheckOut;
	NSInteger _daysCount;
	NSArray *_bookedRooms;
}

@property (nonatomic, strong) NSDate *dateCheckIn;
@property (nonatomic, strong) NSDate *dateCheckOut;
@property (nonatomic) NSInteger daysCount;
@property (nonatomic, strong) NSArray *bookedRooms;

- (id)initWithBookedHoteInfoDic:(NSDictionary *)infoDic;

@end
