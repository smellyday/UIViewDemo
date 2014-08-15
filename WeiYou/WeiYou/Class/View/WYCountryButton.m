//
//  WYCountryButton.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCountryButton.h"
#import "WYMUserCity.h"
#import "consts.h"

@implementation WYCountryButton
@synthesize sysCountry = _sysCountry;
@synthesize userCountry = _userCountry;


- (id)initButtonWithCoutry:(WYMCountry *)country atIndex:(int)index {
    self = [super initButtonWithPlace:country atIndex:index];
    if (self) {
        _sysCountry = country;
    }
    
    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
