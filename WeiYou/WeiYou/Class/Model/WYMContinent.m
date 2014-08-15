//
//  WYMContinent.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMContinent.h"
#import "consts.h"

@implementation WYMContinent
@synthesize allCountries = _allCountries;


- (void)addToAllCountry:(WYMCountry *)country {
    if (!_allCountries) {
        _allCountries = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_allCountries addObject:country];
}

@end
