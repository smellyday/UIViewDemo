//
//  WYTripDayHotelCell.m
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayHotelCell.h"

@implementation WYTripDayHotelCell
@synthesize hotelAddressLabel = _hotelAddressLabel;
@synthesize hotelImageView = _hotelImageView;
@synthesize hotelNameLabel = _hotelNameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code
		self.hotelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
		[self.contentView addSubview:_hotelImageView];
		
		self.hotelNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 220, 55)];
		self.hotelNameLabel.font = [UIFont boldSystemFontOfSize:20];
		self.hotelNameLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_hotelNameLabel];
		
		self.hotelAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 55, 220, 25)];
		self.hotelAddressLabel.font = [UIFont boldSystemFontOfSize:10];
		self.hotelAddressLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_hotelAddressLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
		// Configure the view for the selected state
}

@end
