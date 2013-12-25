//
//  WYTripDaySpotCell.m
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDaySpotCell.h"

@implementation WYTripDaySpotCell
@synthesize spotImageView = _spotImageView;
@synthesize spotNameLabel = _spotNameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code
		self.spotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
		[self.contentView addSubview:_spotImageView];
		
		self.spotNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 200, 60)];
		self.spotNameLabel.font = [UIFont boldSystemFontOfSize:20];
		self.spotNameLabel.textAlignment = NSTextAlignmentCenter;
		[self.contentView addSubview:_spotNameLabel];
		
		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
	
		// Configure the view for the selected state
}

@end
