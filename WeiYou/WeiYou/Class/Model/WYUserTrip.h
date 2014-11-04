//
//  WYUserTrip.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYUserTrip : NSObject {
    
    NSNumber *_tripID; // UUID of one trip.
    NSNumber *_tripVersion;
    NSString *_tripName;
    NSString *_tripMainImageURL;
    NSDate *_tripBeginDate;
    NSDate *_tripEndDate;
    NSDate *_tripCreateDate;
    
    // UserDayManager
    // UserNodeManager

}

@end
