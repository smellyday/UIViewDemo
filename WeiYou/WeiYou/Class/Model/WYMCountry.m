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
    LOGFUNCTION;
    if (!_allCities) {
        _allCities = [NSMutableArray arrayWithCapacity:10];
        
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithCapacity:10];
        [mutDic setObject:@"10002" forKey:@"id"];
        [mutDic setObject:self.ID forKey:@"parent_id"];
        [mutDic setObject:@{@"en":@"Beijing", @"zh-CN":@"北京"} forKey:@"name"];
        WYMCity *mcity = [[WYMCity alloc] initWithInfoDic:mutDic];
        mcity.mCountry = self;
        [_allCities addObject:mcity];
        
        NSMutableDictionary *mutDic2 = [NSMutableDictionary dictionaryWithCapacity:10];
        [mutDic2 setObject:@"10003" forKey:@"id"];
        [mutDic2 setObject:self.ID forKey:@"parent_id"];
        [mutDic2 setObject:@{@"en":@"Shanghai", @"zh-CN":@"上海"} forKey:@"name"];
        WYMCity *mcity2 = [[WYMCity alloc] initWithInfoDic:mutDic2];
        mcity2.mCountry = self;
        [_allCities addObject:mcity2];
        
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
