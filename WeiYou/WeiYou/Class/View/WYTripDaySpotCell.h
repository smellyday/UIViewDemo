//
//  WYTripDaySpotCell.h
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayCell.h"

@interface WYTripDaySpotCell : WYTripDayCell {
	UIImageView *_spotImageView;
	UILabel *_spotNameLabel;
}

@property (nonatomic, strong) UIImageView *spotImageView;
@property (nonatomic, strong) UILabel *spotNameLabel;

@end
