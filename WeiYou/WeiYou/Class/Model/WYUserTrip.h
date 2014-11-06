//
//  WYUserTrip.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserNation.h"
#import "WYUserCity.h"
#import "WYUserSpot.h"
#import "WYTripDay.h"
#import "WYUserDayManager.h"
#import "WYUserNodeManager.h"

@interface WYUserTrip : NSObject {
    
    NSNumber *_tripID; // UUID of one trip.
    NSNumber *_tripVersion;
    NSString *_tripName;
    NSString *_tripMainImageURL;
    NSDate *_tripBeginDate;
    NSDate *_tripEndDate;
    NSDate *_tripCreateDate;
    
    WYUserDayManager *_daysManager;
    WYUserNodeManager *_nodesManager;

}

@property (nonatomic, strong) NSNumber *tripID;
@property (nonatomic, strong) NSNumber *tripVersion;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripMainImageURL;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSDate *tripCreateDate;

@property (nonatomic, strong) WYUserDayManager *daysManager;
@property (nonatomic, strong) WYUserNodeManager *nodesManager;

- (id)initUserTripWithName:(NSString *)name;
- (id)initUserTripWithInfo:(NSDictionary *)tripInfoDic;

- (void)addNation:(WYUserNation *)nation;
- (void)addCity:(WYUserCity *)city;
- (void)addSpot:(WYUserSpot *)spot toDayth:(NSUInteger)dayth;

- (void)delNation:(WYUserNation *)nation;
- (void)delCity:(WYUserCity *)city;
- (void)delSpotFromNodeTree:(WYUserSpot *)spot;

- (void)addNewTripDay;
- (void)delOneTripDay:(WYTripDay *)oneTripDay;

@end
