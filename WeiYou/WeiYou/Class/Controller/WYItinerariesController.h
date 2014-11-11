//
//  WYItinerariesController.h
//  WeiYou
//
//  Created by zhangpan on 14/11/11.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYUserTripAgent.h"

@interface WYItinerariesController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_mTableView;
    WYUserTripAgent *_userTripAgent;
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) WYUserTripAgent *userTripAgent;

@end
