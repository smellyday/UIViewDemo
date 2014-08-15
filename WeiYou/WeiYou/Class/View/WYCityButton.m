//
//  WYCityButton.m
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCityButton.h"
#import "WYMTrip.h"
#import "consts.h"
#import "WYDataEngine.h"
#import "WYMUserCity.h"
#import "WYMUserContinent.h"
#import "WYMUserCountry.h"

@implementation WYCityButton
@synthesize sysCity = _sysCity;
@synthesize userCity = _userCity;

- (id)initButtonWithCity:(WYMCity *)city atIndex:(int)index {
    self = [super initButtonWithPlace:city atIndex:index];
    if (self) {
        _sysCity = city;
    }
    
    return self;
}

@end
