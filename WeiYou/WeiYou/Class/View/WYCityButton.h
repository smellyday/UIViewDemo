//
//  WYCityButton.h
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYPlaceButton.h"
#import "WYMCity.h"

@interface WYCityButton : WYPlaceButton {
    WYMCity *_theCity;
}

@property (nonatomic, readonly) WYMCity *theCity;

- (id)initButtonWithCity:(WYMCity *)city atIndex:(int)index;
- (void)registerChooseCityFunction;


@end
