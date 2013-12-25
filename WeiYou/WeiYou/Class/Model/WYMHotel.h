//
//  WYMHotel.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	//hotel type: 星级酒店，客栈，名宿，快捷酒店
#import <Foundation/Foundation.h>
#import "WYMSpot.h"

@interface WYMHotel : WYMSpot {
	NSString *_hotelName;
	NSString *_hotelAddress;
	
	NSArray *_hotelPhonesArray;
	NSArray *_hotelImageArray;
	NSArray *_hotelRoomsArray; // different room types.
}

@property (nonatomic, strong) NSString *hotelName;
@property (nonatomic, strong) NSString *hotelAddress;
@property (nonatomic, strong) NSArray *hotelPhonesArray;
@property (nonatomic, strong) NSArray *hotelImageArray;
@property (nonatomic, strong) NSArray *hotelRoomsArray;

- (id)initWithHotelInfoDic:(NSDictionary *)infoDic;

@end
