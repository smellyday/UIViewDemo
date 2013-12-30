//
//  WYCoverTableViewCell.m
//  WeiYou
//
//  Created by owen on 11/21/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYCoverTableViewCell.h"
#import "WYCMTrip.h"

@implementation WYCoverTableViewCell
@synthesize xcMainImageView = _xcMainImageView;
@synthesize xcNameLabel =_xcNameLabel;
@synthesize xcDesLabel = _xcDesLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		
    }
    return self;
}

- (id)initWithXCModel:(WYCMTrip *)data reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code
		
        UIImage *mainImg = [UIImage imageWithData:data.tripMainImageData];
		UIImageView *mImageView = [[UIImageView alloc] initWithImage:mainImg];
		mImageView.frame = CGRectMake(5, 5, 150, 90);
		[self.contentView addSubview:mImageView];
		self.xcMainImageView = mImageView;
		
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 5, 120, 90)];
		nameLabel.textAlignment = NSTextAlignmentLeft;
		nameLabel.text = data.tripName;
		nameLabel.backgroundColor = [UIColor clearColor];
		nameLabel.adjustsFontSizeToFitWidth = YES;
		nameLabel.minimumScaleFactor = 18;
		[self.contentView addSubview:nameLabel];
		self.xcNameLabel = nameLabel;
		
//		UILabel *desLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 70, 120, 30)];
//		desLabel.textAlignment = NSTextAlignmentLeft;
//		desLabel.text = data.xcDescription;
//		desLabel.backgroundColor = [UIColor clearColor];
//		nameLabel.adjustsFontSizeToFitWidth = YES;
//		nameLabel.minimumScaleFactor = 1;
//		[self.contentView addSubview:desLabel];
//		self.xcDesLabel = desLabel;
		
		
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
