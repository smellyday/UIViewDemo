//
//  WYMUserCity.h
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMPlace.h"

@class WYMUserSpot, WYMCity, WYMUserCountry;
@interface WYMUserCity : WYMPlace {
    WYMCity *_sysCity;
    __weak WYMUserCountry *_countryOfUser;
    NSMutableArray *_chosenSpots;
}

@property (nonatomic, readonly) WYMCity *sysCity;
@property (nonatomic, weak) WYMUserCountry *countryOfUser;
@property (nonatomic, readonly) NSMutableArray *chosenSpots;

- (id)initWithSystemCity:(WYMCity *)city;
- (void)addSpot:(WYMUserSpot *)spot;
- (void)delSpot:(WYMUserSpot *)spot;
- (NSDictionary *)transferToDic;

@end
