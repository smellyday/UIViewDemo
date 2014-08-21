//
//  WYMyItineraryController.h
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYDataEngine.h"

@interface WYMyItineraryController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	WYUserTripAgent *_userTripAgent;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYUserTripAgent *userTripAgent;

@end
