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
    NSDate *_todayDate;
    NSUInteger _dayth;
    NSMutableArray *_spotsArray;
}

@property (nonatomic, strong) NSDate *todayDate;
@property (nonatomic) NSUInteger dayth;
@property (nonatomic, strong) NSMutableArray *spotsArray;

- (id)initTripDayWithDayth:(NSUInteger)dayth;

- (void)addSpot:(WYUserSpot *)spot;
- (void)delSpot:(WYUserSpot *)spot;

@end
