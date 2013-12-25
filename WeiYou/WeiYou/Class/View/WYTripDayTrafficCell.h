//
//  WYTripDayTrafficCell.h
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayCell.h"

@interface WYTripDayTrafficCell : WYTripDayCell {
	UILabel *_departureLabel;
	UILabel *_destinationLabel;
	UILabel *_takeOffTimeLabel;
	UILabel *_trafficNumberLabel;
	UILabel *_priceLabel;
}

@property (nonatomic, strong) UILabel *departureLabel;
@property (nonatomic, strong) UILabel *destinationLabel;
@property (nonatomic, strong) UILabel *takeOffTimeLabel;
@property (nonatomic, strong) UILabel *trafficNumberLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@end
