//
//  WYCountryButton.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPlaceButton.h"
#import "WYMCountry.h"

@interface WYCountryButton : WYPlaceButton {
    WYMCountry *_theCountry;
}

@property (nonatomic, readonly) WYMCountry *theCountry;

- (id)initButtonWithPlace:(WYMCountry *)place atIndex:(int)index;

@end
