//
//  WYTripController.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYMTrip.h"

@interface WYTripController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	
	NSArray *_daysArray;
	WYMTrip *_trip;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *daysArray;
@property (nonatomic, strong) WYMTrip *trip;

@end
