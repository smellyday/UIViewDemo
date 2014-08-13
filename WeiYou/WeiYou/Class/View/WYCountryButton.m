//
//  WYCountryButton.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCountryButton.h"

@implementation WYCountryButton
@synthesize theCountry = _theCountry;


- (id)initButtonWithPlace:(WYMCountry *)place atIndex:(int)index {
    self = [super initButtonWithPlace:place atIndex:index];
    _theCountry = place;
    
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
