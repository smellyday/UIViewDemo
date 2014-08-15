//
//  WYMContinent.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMPlace.h"

@class WYMCountry;
@interface WYMContinent : WYMPlace {
    NSMutableArray *_allCountries;
}

@property (nonatomic, readonly) NSMutableArray *allCountries;

- (void)addToAllCountry:(WYMCountry *)country;

@end
