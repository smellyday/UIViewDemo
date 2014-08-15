//
//  WYCitiesController.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYCountryButton;
@interface WYCitiesController : UIViewController {
    WYCountryButton *_countryBtn;
}

@property (nonatomic, strong) WYCountryButton *countryBtn;

@end
