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
#import "WYMUserContinent.h"
#import "consts.h"

@implementation WYMUserCountry
@synthesize chosenCities = _chosenCities;
@synthesize continentOfUser = _continentOfUser;
@synthesize sysCountry = _sysCountry;

- (id)initWithSystemCountry:(WYMCountry *)country {
    self = [super initWithOtherPlace:(WYMPlace *)country];
    if (self) {
        _sysCountry = country;
    }
    return self;
}

- (void)addCity:(WYMUserCity *)city {
    if (!_chosenCities) {
        _chosenCities = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_chosenCities addObject:city];
}

- (void)delCity:(WYMUserCity *)city {
    for (WYMUserCity *userCity in _chosenCities) {
        if (city.ID == userCity.ID) {
            mlog(@"I got you!! The city I want to unchoose.");
            [_chosenCities removeObject:userCity];
            
            if ([_chosenCities count] == 0) {
                [userCity.countryOfUser.continentOfUser delCountry:userCity.countryOfUser];
            }
            
            userCity.countryOfUser = nil;
            break;
        }
    }
}

- (NSDictionary *)transferToDic {
    return nil;
}


@end
