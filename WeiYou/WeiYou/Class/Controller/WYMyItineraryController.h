//
//  WYMyItineraryController.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYMyItineraryController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	NSMutableArray *_trips;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *trips;

@end
