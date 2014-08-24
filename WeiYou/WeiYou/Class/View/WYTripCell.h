//
//  WYTripCell.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYMTrip.h"

typedef enum {
    tripCellStateNormal = 0,
	tripCellStateExpanding,
    tripCellStateExpanded,
} TripCellStatus;


@class WYTripCell;
@protocol TripCellDelegate

- (void)cellStateChanged:(WYTripCell *)cell;
- (TripCellStatus)getTableViewState;
- (void)recoverTableViewToNormal;

- (void)deleteTripCell:(WYTripCell *)cell;
- (void)editTripCell:(WYTripCell *)cell;

@end



@interface WYTripCell : UITableViewCell <UIGestureRecognizerDelegate> {
	UILabel *_daythLabel;
	UILabel *_dateLabel;
	UILabel *_weekLabel;
	UILabel *_citiesNameLabel;
	
	NSIndexPath *_indexPath;
    
    UIView *_realContentView;
    TripCellStatus _cellSt;
	id<TripCellDelegate> _delegate;
}

@property (nonatomic, strong) UILabel *daythLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *citiesNameLabel;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, readonly) UIView *realContentView;
@property (nonatomic) TripCellStatus cellSt;
@property (nonatomic) id<TripCellDelegate> delegate;

- (void)backToNormalState;

@end





