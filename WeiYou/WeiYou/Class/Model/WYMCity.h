//
//  WYMCity.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMPlace.h"

@class WYMCountry, WYMSpot;
@interface WYMCity : WYMPlace {
    __weak WYMCountry *_mCountry;
    NSMutableArray *_allSpots;
}

@property (nonatomic, weak) WYMCountry *mCountry;
@property (nonatomic, readonly) NSMutableArray *allSpots;

@end
