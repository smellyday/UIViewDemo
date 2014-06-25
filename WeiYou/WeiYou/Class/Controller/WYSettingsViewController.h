//
//  WYSettingsViewController.h
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYGlobalState.h"
#import "ASIHttpRequest.h"

@interface WYSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ASIHTTPRequestDelegate> {
	UITableView *_mTableView;
    WYGlobalState *_globalState;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYGlobalState *globalState;

@end
