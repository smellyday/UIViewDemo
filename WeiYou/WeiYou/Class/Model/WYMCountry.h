//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYPlace.h"

@interface WYMCountry : WYPlace {
}

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllCities;

@end
