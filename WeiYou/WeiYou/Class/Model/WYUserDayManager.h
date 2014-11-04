//
//  WYUserDayManager.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYTripDay.h"

@interface WYUserDayManager : NSObject {
    NSMutableArray *_daysArray;
}

@property (nonatomic, strong) NSMutableArray *daysArray;

- (NSUInteger)countOfDaysArray;
- (WYTripDay *)objectInDaysArrayAtIndex:(NSUInteger)index;

@end
