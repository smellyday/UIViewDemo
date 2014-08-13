//
//  WYMContinent.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMPlace.h"

@class WYMCountry;
@interface WYMContinent : WYMPlace {
    NSMutableArray *_allCountries;
    NSMutableArray *_chosenCountries;
}

@property (nonatomic, readonly) NSMutableArray *allCountries;
@property (nonatomic, readonly) NSMutableArray *chosenCountries;

- (void)addToAllCountry:(WYMCountry *)country;
- (void)chooseCountry:(WYMCountry *)country;
- (void)unchooseCountry:(WYMCountry *)country;

- (NSDictionary *)transferToDic;

@end
