//
//  WYCountryButton.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYPlaceButton.h"
#import "WYMCountry.h"
#import "WYMUserCountry.h"

@interface WYCountryButton : WYPlaceButton {
    WYMCountry *_sysCountry;
    WYMUserCountry *_userCountry;
}

@property (nonatomic, readonly) WYMCountry *sysCountry;
@property (nonatomic, strong) WYMUserCountry *userCountry;

- (id)initButtonWithCoutry:(WYMCountry *)country atIndex:(int)index;

@end
