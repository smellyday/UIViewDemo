//
//  WYTripDayTrafficCell.m
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayTrafficCell.h"

@implementation WYTripDayTrafficCell
@synthesize departureLabel = _departureLabel;
@synthesize destinationLabel = _destinationLabel;
@synthesize takeOffTimeLabel = _takeOffTimeLabel;
@synthesize trafficNumberLabel = _trafficNumberLabel;
@synthesize priceLabel = _priceLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code
		self.trafficNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
		self.trafficNumberLabel.font = [UIFont boldSystemFontOfSize:20];
		self.trafficNumberLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_trafficNumberLabel];
		
		self.departureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 85, 30)];
		self.departureLabel.font = [UIFont boldSystemFontOfSize:15];
		self.departureLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_departureLabel];
		
		self.destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 50, 85, 30)];
		self.destinationLabel.font = [UIFont boldSystemFontOfSize:15];
		self.destinationLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_destinationLabel];
		
		self.takeOffTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 120, 50)];
		self.takeOffTimeLabel.font = [UIFont boldSystemFontOfSize:10];
		self.takeOffTimeLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_takeOffTimeLabel];
		
		self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 120, 30)];
		self.priceLabel.font = [UIFont boldSystemFontOfSize:10];
		self.priceLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_priceLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
		// Configure the view for the selected state
}

@end
