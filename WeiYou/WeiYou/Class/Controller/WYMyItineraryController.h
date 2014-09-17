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

@interface WYMyItineraryController : UIViewController <UITableViewDataSource, UITableViewDelegate, TripCellDelegate, UIAlertViewDelegate> {
	
	UITableView *_mTableView;
	WYUserTripAgent *_userTripAgent;
	
	NSMutableSet *_registerCellSet;//the cells who are showing "delete" & "edit".
	WYTripCell *_manipulatingCell;//editing or going to delete
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYUserTripAgent *userTripAgent;
@property (nonatomic, readonly) NSMutableSet *registerCellSet;
@property (nonatomic, strong) WYTripCell *manipulatingCell;

@end
