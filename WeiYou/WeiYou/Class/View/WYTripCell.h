//
//  WYTripCell.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYTripCell : UITableViewCell {
	UILabel *_daythLabel;
	UILabel *_dateLabel;
	UILabel *_weekLabel;
	
	UILabel *_citiesNameLabel;
}

@property (nonatomic, strong) UILabel *daythLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *citiesNameLabel;

@end
