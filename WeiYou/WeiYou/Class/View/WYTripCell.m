//
//  WYTripCell.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	// cell height is 80

#import "WYTripCell.h"
#import "consts.h"

@implementation WYTripCell
@synthesize daythLabel = _daythLabel;
@synthesize dateLabel = _dateLabel;
@synthesize weekLabel = _weekLabel;
@synthesize citiesNameLabel = _citiesNameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		UIView *baner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
		baner.backgroundColor = WY_MAIN_COLOR_BG;
		self.daythLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 90, 20)];
		self.daythLabel.font = [UIFont systemFontOfSize:10];
		[baner addSubview:_daythLabel];
		self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 20)];
		self.dateLabel.font = [UIFont systemFontOfSize:10];
		[baner addSubview:_dateLabel];
		self.weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 0, 100, 20)];
		self.weekLabel.font = [UIFont systemFontOfSize:10];
		[baner addSubview:_weekLabel];
		[self.contentView addSubview:baner];
		
		self.citiesNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 270, 40)];
		self.citiesNameLabel.font = [UIFont systemFontOfSize:10];
		[self.contentView addSubview:_citiesNameLabel];
		
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
