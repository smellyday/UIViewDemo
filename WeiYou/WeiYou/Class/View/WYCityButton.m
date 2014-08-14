//
//  WYCityButton.m
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCityButton.h"
#import "WYMTrip.h"
#import "consts.h"
#import "WYDataEngine.h"
#import "WYMUserCity.h"

@implementation WYCityButton
@synthesize theCity = _theCity;

- (id)initButtonWithCity:(WYMCity *)city atIndex:(int)index {
    self = [super initButtonWithPlace:city atIndex:index];
    if (self) {
        _theCity = city;
    }
    
    return self;
}


- (void)registerChooseCityFunction {
    [self addTarget:self action:@selector(chooseTheCity:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - On Click Event.
- (void)chooseTheCity:(id)sender {
    WYMTrip *creatingTrip = [[WYDataEngine sharedDataEngine] creatingTrip];
    WYMUserCity *userChosedCity = [[WYMUserCity alloc] initWithSystemCity:_theCity];
    if (self.selected == YES) {
        self.selected = NO;
        [creatingTrip unchooseCity:userChosedCity];
    } else {
        self.selected = YES;
        [creatingTrip chooseCity:userChosedCity];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"chosenCityChanged" object:_theCity userInfo:nil];
}

@end
