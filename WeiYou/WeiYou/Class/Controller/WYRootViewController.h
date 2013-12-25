//
//  WYRootViewController.h
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYRootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
	NSMutableArray *_tripsArray;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSArray *tripsArray;

@end
