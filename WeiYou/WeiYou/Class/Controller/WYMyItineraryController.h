//
//  WYMyItineraryController.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYDataEngine.h"
#import "WYTripCell.h"

@interface WYMyItineraryController : UIViewController <UITableViewDataSource, UITableViewDelegate, TripCellDelegate> {
	UITableView *_mTableView;
	WYUserTripAgent *_userTripAgent;
	
	NSMutableSet *_registerCellSet;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYUserTripAgent *userTripAgent;
@property (nonatomic, readonly) NSMutableSet *registerCellSet;

@end
