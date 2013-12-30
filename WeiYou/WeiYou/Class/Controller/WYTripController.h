//
//  WYTripController.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYCMTrip.h"

@interface WYTripController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	
	NSMutableArray *_daysArray;
	WYCMTrip *_trip;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSMutableArray *daysArray;
@property (nonatomic, strong) WYCMTrip *trip;

@end
