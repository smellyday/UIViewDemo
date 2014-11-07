//
//  WYTripDay.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserSpot.h"

@interface WYTripDay : NSObject {
    NSMutableArray *_spotsArray;
}

@property (nonatomic, strong) NSMutableArray *spotsArray;

#pragma -- init
- (id)initTripDay;

#pragma -- operate
- (void)addSpot:(WYUserSpot *)spot;
- (void)delSpot:(WYUserSpot *)spot;

@end
