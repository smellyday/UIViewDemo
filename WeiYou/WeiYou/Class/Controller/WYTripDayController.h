//
//  WYTripDayController.h
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYMTripDay.h"

@interface WYTripDayController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	
	NSString *_tripName;
	WYMTripDay *_tripDay;
	NSMutableArray *_trafficArray;
	NSMutableArray *_hotelsArray;
	NSMutableArray *_spotsArray;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) WYMTripDay *tripDay;
@property (nonatomic, strong) NSMutableArray *trafficArray;
@property (nonatomic, strong) NSMutableArray *hotelsArray;
@property (nonatomic, strong) NSMutableArray *spotsArray;

@end
