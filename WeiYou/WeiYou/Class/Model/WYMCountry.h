//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMPlace.h"


@interface WYMCountry : WYMPlace {
    NSMutableArray *_allCities;
    NSMutableArray *_chosenCities;
}

@property (nonatomic, readonly) NSMutableArray *allCities;
@property (nonatomic, readonly) NSMutableArray *chosenCities;

- (NSDictionary *)transferToDic;

@end
