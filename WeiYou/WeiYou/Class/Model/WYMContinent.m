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
@synthesize chosenCountries = _chosenCountries;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
        _ID = [infoDic objectForKey:WY_PLACE_ID];
        _parentID = [infoDic objectForKey:WY_PLACE_PARENT_ID];
        _name = [[infoDic objectForKey:WY_PLACE_NAME] objectForKey:WY_NAME_ZHCH];
	}
	return self;
}

- (void)addToAllCountry:(WYMCountry *)country {
    if (!_allCountries) {
        _allCountries = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_allCountries addObject:country];
}

- (void)chooseCountry:(WYMCountry *)country {
    if (!_chosenCountries) {
        _chosenCountries = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_chosenCountries addObject:country];
}

- (void)unchooseCountry:(WYMCountry *)country {
    
}

- (NSDictionary *)transferToDic {
    return nil;
}

@end
