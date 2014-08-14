//
//  WYMCountry.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMCountry.h"
#import "consts.h"
#import "WYMCity.h"

@implementation WYMCountry
@synthesize allCities = _allCities;
@synthesize mContinent = _mContinent;


- (NSMutableArray *)allCities {
    if (!_allCities) {
        _allCities = [NSMutableArray arrayWithCapacity:10];
        
        for (int i = 0; i < 100; i++) {
            NSDictionary *infoDic = @{@"id":@"1002", @"parent_id":@"208", @"name":@{@"en":@"Beijing", @"zh-CN":@"北京"}};
            WYMCity *mcity = [[WYMCity alloc] initWithInfoDic:infoDic];
            mcity.mCountry = self;
            [_allCities addObject:mcity];
        }
        
    }
    
    return _allCities;
}


- (void)addToAllCity:(WYMCity *)city {
    if (!_allCities) {
        _allCities = [NSMutableArray arrayWithCapacity:10];
    }
    
    [_allCities addObject:city];
}


@end
