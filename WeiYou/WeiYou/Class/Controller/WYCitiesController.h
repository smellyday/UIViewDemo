//
//  WYCitiesController.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYNationButton.h"
#import "WYSysDestinations.h"

@interface WYCitiesController : UIViewController <DestinationsDataDelegate> {
    WYNationButton *_nationButton;
    NSArray *_sysCities;
    
    UIActivityIndicatorView *_indicatorView;
}

@property (nonatomic, strong) WYNationButton *nationButton;
@property (nonatomic, strong) NSArray *sysCities;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end
