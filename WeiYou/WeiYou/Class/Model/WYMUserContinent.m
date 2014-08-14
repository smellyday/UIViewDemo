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
    
}

- (void)delCountry:(WYMUserCountry *)country {
    
}

- (NSDictionary *)transferToDic {
    return nil;
}


@end
