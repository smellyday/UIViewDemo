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
    UIImageView *_mainImageView;
    UILabel *_mainTitleLabel;
    UILabel *_citiesDesLabel;
    UILabel *_departureDateLabel;
    UILabel *_daysNumberLabel;
    
	NSIndexPath *_indexPath;
    UIView *_realContentView;
    TripCellStatus _cellSt;
	id<TripCellDelegate> _delegate;
}

@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UILabel *mainTitleLabel;
@property (nonatomic, strong) UILabel *citiesDesLabel;
@property (nonatomic, strong) UILabel *departureDateLabel;
@property (nonatomic, strong) UILabel *daysNumberLabel;

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, readonly) UIView *realContentView;
@property (nonatomic) TripCellStatus cellSt;
@property (nonatomic) id<TripCellDelegate> delegate;

- (void)backToNormalState;

@end





