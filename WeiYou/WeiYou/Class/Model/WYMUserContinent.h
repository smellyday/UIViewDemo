//
//  WYMUserContinent.h
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMPlace.h"

@class WYMUserCountry, WYMContinent;
@interface WYMUserContinent : WYMPlace {
    WYMContinent *_sysContinent;
    NSMutableArray *_chosenCountries;
}

@property (nonatomic, readonly) WYMContinent *sysContinent;
@property (nonatomic, strong) NSMutableArray *chosenCountries;

- (id)initWithSystemContinent:(WYMContinent *)continent;
- (void)addCountry:(WYMUserCountry *)country;
- (void)delCountry:(WYMUserCountry *)country;
- (NSDictionary *)transferToDic;

@end
