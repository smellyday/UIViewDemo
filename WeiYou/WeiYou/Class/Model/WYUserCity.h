//
//  WYUserCity.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"
#import "WYUserNation.h"
#import "WYSysCity.h"

@class WYUserSpot;
@interface WYUserCity : WYUserNode {
    WYSysCity *_corSysCity;
    WYUserNation * __weak _userParentNation;
    NSMutableArray *_spotsArray;
}

@property (nonatomic, readonly) WYSysCity *corSysCity;
@property (nonatomic, weak) WYUserNation *userParentNation;
@property (nonatomic, strong) NSMutableArray *spotsArray;

#pragma -- init
- (id)initWithSysCity:(WYSysCity *)sysCity;

@end