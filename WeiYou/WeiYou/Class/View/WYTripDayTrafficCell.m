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
        int wLocation = -80;
        int wid = 20;
        
        UILabel *fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80+wLocation, 40)];
        fromLabel.font = [UIFont boldSystemFontOfSize:12];
        fromLabel.text = @"出发地： ";
		[self.contentView addSubview:fromLabel];
        
		self.departureLabel = [[UILabel alloc] initWithFrame:CGRectMake(80+wLocation, 0, 120, 40)];
		self.departureLabel.font = [UIFont boldSystemFontOfSize:15];
		self.departureLabel.textAlignment = NSTextAlignmentLeft;
		[self.contentView addSubview:_departureLabel];
		
        
        UILabel *toLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 80+wLocation, 40)];
        toLabel.font = [UIFont boldSystemFontOfSize:12];
        toLabel.text = @"目的地： ";
		[self.contentView addSubview:toLabel];
        
		self.destinationLabel = [[UILabel alloc] initWithFrame:CGRectMake(80+wLocation, 40, 120, 40)];
		self.destinationLabel.font = [UIFont boldSystemFontOfSize:15];
		self.destinationLabel.textAlignment = NSTextAlignmentLeft;
		[self.contentView addSubview:_destinationLabel];
        
        
        UILabel *trafficLabel = [[UILabel alloc] initWithFrame:CGRectMake(200+wLocation, 0, 50, 25)];
        trafficLabel.textAlignment = NSTextAlignmentRight;
        trafficLabel.font = [UIFont boldSystemFontOfSize:12];
        trafficLabel.text = @"航班号： ";
		[self.contentView addSubview:trafficLabel];
        
		self.trafficNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(250+wLocation, 0, 70+wid, 25)];
		self.trafficNumberLabel.font = [UIFont boldSystemFontOfSize:12];
		self.trafficNumberLabel.textAlignment = NSTextAlignmentLeft;
		[self.contentView addSubview:_trafficNumberLabel];
        
        UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(200+wLocation, 25, 50, 25)];
        dateLabel.textAlignment = NSTextAlignmentRight;
        dateLabel.font = [UIFont boldSystemFontOfSize:12];
        dateLabel.text = @"日期： ";
		[self.contentView addSubview:dateLabel];
		
		self.takeOffTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(250+wLocation, 25, 70+wid, 25)];
		self.takeOffTimeLabel.font = [UIFont boldSystemFontOfSize:12];
		self.takeOffTimeLabel.textAlignment = NSTextAlignmentLeft;
		[self.contentView addSubview:_takeOffTimeLabel];
        
        UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(200+wLocation, 50, 50, 25)];
        pLabel.textAlignment = NSTextAlignmentRight;
        pLabel.font = [UIFont boldSystemFontOfSize:12];
        pLabel.text = @"价格： ";
		[self.contentView addSubview:pLabel];
		
		self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(250+wLocation, 50, 70+wid, 25)];
		self.priceLabel.font = [UIFont boldSystemFontOfSize:10];
		self.priceLabel.textAlignment = NSTextAlignmentLeft;
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
