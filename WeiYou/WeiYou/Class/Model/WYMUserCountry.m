//
//  WYMUserCountry.m
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMUserCountry.h"
#import "WYMCountry.h"
#import "WYMUserCity.h"
#import "consts.h"

@implementation WYMUserCountry
@synthesize chosenCities = _chosenCities;
@synthesize sysCountry = _sysCountry;

- (id)initWithSystemCountry:(WYMCountry *)country {
    self = [super initWithOtherPlace:(WYMPlace *)country];
    if (self) {
        _sysCountry = country;
    }
    return self;
}

- (void)addCity:(WYMUserCity *)city {
    
}

- (void)delCity:(WYMUserCity *)city {
    
}

- (NSDictionary *)transferToDic {
    return nil;
}


@end
