//
//  WYCityButton.h
//  WeiYou
//
//  Created by zhangpan on 14-8-14.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYPlaceButton.h"
#import "WYMCity.h"
#import "WYMUserCity.h"

@interface WYCityButton : WYPlaceButton {
    WYMCity *_sysCity;
    WYMUserCity *_userCity;
}

@property (nonatomic, readonly) WYMCity *sysCity;
@property (nonatomic, strong) WYMUserCity *userCity;

- (id)initButtonWithCity:(WYMCity *)city atIndex:(int)index;


@end
