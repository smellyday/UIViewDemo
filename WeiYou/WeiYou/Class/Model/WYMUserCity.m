//
//  WYMUserCity.m
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMUserCity.h"
#import "WYMCity.h"
#import "WYMUserSpot.h"
#import "consts.h"

@implementation WYMUserCity
@synthesize sysCity = _sysCity;
@synthesize countryOfUser = _countryOfUser;
@synthesize chosenSpots = _chosenSpots;

- (id)initWithSystemCity:(WYMCity *)city {
    self = [super initWithOtherPlace:(WYMPlace *)city];
    if (self) {
        _sysCity = city;
    }
    return self;
}

- (void)addSpot:(WYMUserSpot *)spot {
    if (!_chosenSpots) {
        _chosenSpots = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_chosenSpots addObject:spot];
}

- (void)delSpot:(WYMUserSpot *)spot {
    [_chosenSpots removeObject:spot];
}

- (NSDictionary *)transferToDic {
    return nil;
}

@end
