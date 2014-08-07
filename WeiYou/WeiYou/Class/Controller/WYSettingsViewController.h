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

@interface WYSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, ASIHTTPRequestDelegate> {
	UITableView *_mTableView;
    
    ASIHTTPRequest *_userInfoRequest;
    ASIHTTPRequest *_userImageRequest;
    
    ASIHTTPRequest *_callbackRequest;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) ASIHTTPRequest *userInfoRequest;
@property (nonatomic, strong) ASIHTTPRequest *userImageRequest;
@property (nonatomic, strong) ASIHTTPRequest *callbackRequest;


@end
