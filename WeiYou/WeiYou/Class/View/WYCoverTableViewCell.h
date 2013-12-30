//
//  WYCoverTableViewCell.h
//  WeiYou
//
//  Created by owen on 11/21/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYCMTrip;

@interface WYCoverTableViewCell : UITableViewCell {
	UIImageView *xcMainImageView;
	UILabel *xcNameLabel;
	UILabel *xcDesLabel;
}

@property (nonatomic, strong) UIImageView *xcMainImageView;
@property (nonatomic, strong) UILabel *xcNameLabel;
@property (nonatomic, strong) UILabel *xcDesLabel;


- (id)initWithXCModel:(WYCMTrip *)data reuseIdentifier:(NSString *)reuseIdentifier;

@end
