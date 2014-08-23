//
//  WYTripTableView.h
//  WeiYou
//
//  Created by owen on 8/24/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYTripCell.h"

@interface WYTripTableView : UITableView {
	TripCellStatus _cellState;
	WYTripCell *_chsCell;
	
	BOOL isContain;
}

@property (nonatomic, readonly) TripCellStatus cellState;
@property (nonatomic, readonly) WYTripCell *chsCell;

- (void)registerTripCell:(WYTripCell *)cell;

@end
