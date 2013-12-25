//
//  WYCityCell.m
//  WeiYou
//
//  Created by owen on 12/4/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYCityCell.h"

@implementation WYCityCell
@synthesize cityModel = _cityModel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
