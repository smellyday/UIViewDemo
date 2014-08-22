//
//  WYTripCell.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    tripCellStatusNormal = 0,
    tripCellStatusExpanding,
    tripCellStatusExpanded,
} TripCellStatus;

@interface WYTripCell : UITableViewCell <UIGestureRecognizerDelegate> {
	UILabel *_daythLabel;
	UILabel *_dateLabel;
	UILabel *_weekLabel;
	
	UILabel *_citiesNameLabel;
    
    UIView *_realContentView;
    TripCellStatus _cellSt;
}

@property (nonatomic, strong) UILabel *daythLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *citiesNameLabel;


@property (nonatomic, readonly) UIView *realContentView;
@property (nonatomic) TripCellStatus cellSt;

- (void)recover;

@end
