//
//  WYCitiesController.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYMCountry;
@interface WYCitiesController : UIViewController {
    WYMCountry *_country;
}

@property (nonatomic, strong) WYMCountry *country;

@end
