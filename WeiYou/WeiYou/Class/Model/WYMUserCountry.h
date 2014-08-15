//
//  WYMUserCountry.h
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMPlace.h"

@class WYMUserCity, WYMCountry, WYMUserContinent;
@interface WYMUserCountry : WYMPlace {
    WYMCountry *_sysCountry;
    __weak WYMUserContinent *_continentOfUser;
    NSMutableArray *_chosenCities;
}

@property (nonatomic, readonly) WYMCountry *sysCountry;
@property (nonatomic, weak) WYMUserContinent *continentOfUser;
@property (nonatomic, strong) NSMutableArray *chosenCities;

- (id)initWithSystemCountry:(WYMCountry *)country;
- (void)addCity:(WYMUserCity *)city;
- (void)delCity:(WYMUserCity *)city;
- (NSDictionary *)transferToDic;

@end
