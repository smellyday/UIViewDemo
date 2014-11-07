//
//  WYTripDay.m
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYTripDay.h"

@implementation WYTripDay
@synthesize spotsArray = _spotsArray;

// -----------



#pragma -- init
- (id)initTripDay {
    self = [super init];
    if (self) {
        self.spotsArray = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
}



#pragma -- operate
- (void)addSpot:(WYUserSpot *)spot {
    [self.spotsArray addObject:spot];
}

- (void)delSpot:(WYUserSpot *)spot {
    [self.spotsArray removeObject:spot];
}
























































@end
