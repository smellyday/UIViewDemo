//
//  WYTripDayHotelCell.h
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayCell.h"

@interface WYTripDayHotelCell : WYTripDayCell {
	UIImageView *_hotelImageView;
	UILabel *_hotelNameLabel;
	UILabel *_hotelAddressLabel;
}

@property (nonatomic, strong) UIImageView *hotelImageView;
@property (nonatomic, strong) UILabel *hotelNameLabel;
@property (nonatomic, strong) UILabel *hotelAddressLabel;

@end
