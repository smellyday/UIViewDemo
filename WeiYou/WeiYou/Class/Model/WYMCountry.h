//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMPlace.h"

@class WYMContinent, WYMCity;
@interface WYMCountry : WYMPlace {
    WYMContinent *_mContinent;
    NSMutableArray *_allCities;
}

@property (nonatomic, strong) WYMContinent *mContinent;
@property (nonatomic, readonly) NSMutableArray *allCities;

- (void)addToAllCity:(WYMCity *)city;

@end
