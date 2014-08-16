//
//  WYShiButton.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYNodeButton.h"
#import "WYSysCity.h"
#import "WYUserCity.h"

@interface WYShiButton : WYNodeButton {
	WYSysCity *_sysCity;
	WYUserCity *_userCity;
}

@property (nonatomic, readonly) WYSysCity *sysCity;
@property (nonatomic, strong) WYUserCity *userCity;

- (id)initButtonWithCity:(WYSysCity *)city atIndex:(int)index;

@end
