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
//		UIView *baner = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
//		baner.backgroundColor = [UIColor clearColor];
		self.daythLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 80)];
		self.daythLabel.font = [UIFont systemFontOfSize:18];
        self.daythLabel.textAlignment = NSTextAlignmentCenter;
//        self.daythLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_daythLabel];
		self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(80+80, 60, 100, 20)];
		self.dateLabel.font = [UIFont systemFontOfSize:10];
//        self.dateLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_dateLabel];
		self.weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(180+80, 60, 100, 20)];
		self.weekLabel.font = [UIFont systemFontOfSize:10];
//        self.weekLabel.backgroundColor = [UIColor yellowColor];
		[self.contentView addSubview:_weekLabel];
		
		self.citiesNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 200, 40)];
		self.citiesNameLabel.font = [UIFont boldSystemFontOfSize:20];
        self.citiesNameLabel.textAlignment = NSTextAlignmentLeft;
//        self.citiesNameLabel.backgroundColor = [UIColor greenColor];
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
