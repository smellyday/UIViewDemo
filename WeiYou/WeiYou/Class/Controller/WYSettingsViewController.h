//
//  WYSettingsViewController.h
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYGlobalState.h"

@interface WYSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	UITableView *_mTableView;
    WYGlobalState *_globalState;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYGlobalState *globalState;

@end
