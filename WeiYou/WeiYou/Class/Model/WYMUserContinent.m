//
//  WYMUserContinent.m
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMUserContinent.h"
#import "WYMContinent.h"
#import "WYMUserCountry.h"
#import "WYMTrip.h"
#import "WYDataEngine.h"
#import "consts.h"

@implementation WYMUserContinent
@synthesize sysContinent = _sysContinent;
@synthesize chosenCountries = _chosenCountries;

- (id)initWithSystemContinent:(WYMContinent *)continent {
    self = [super initWithOtherPlace:(WYMPlace *)continent];
    if (self) {
        _sysContinent = continent;
    }
    return self;
}

- (void)addCountry:(WYMUserCountry *)country {
    if (!_chosenCountries) {
        _chosenCountries = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_chosenCountries addObject:country];
}

- (void)delCountry:(WYMUserCountry *)country {
    for (WYMUserCountry *userContry in _chosenCountries) {
        if (userContry.ID == country.ID) {
            [_chosenCountries removeObject:userContry];
            
            if ([_chosenCountries count] == 0) {
                [[[[WYDataEngine sharedDataEngine] creatingTrip] chosenContinentsArray] removeObject:userContry.continentOfUser];
            }
            
            userContry.continentOfUser = nil;
            break;
        }
    }
}

- (NSDictionary *)transferToDic {
    return nil;
}


@end
