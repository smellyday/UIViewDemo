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
@synthesize theCountry = _theCountry;


- (id)initButtonWithCoutry:(WYMCountry *)country atIndex:(int)index {
    self = [super initButtonWithPlace:country atIndex:index];
    if (self) {
        _theCountry = country;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chosenCityChangeNoti:) name:@"chosenCityChanged" object:nil];
    }
    
    return self;
}

- (void)chosenCityChangeNoti:(NSNotification *)notification {
    LOGFUNCTION;
    if ([notification.object isKindOfClass:[WYMUserCity class]]) {
        WYMUserCity *tc = (WYMUserCity *)notification.object;
        if (tc.ID == _theCountry.ID) {
            self.selected = YES;
        } else {
            self.selected = NO;
        }
    }
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
