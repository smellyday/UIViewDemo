//
//  WYMTraffic.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	WYTrafficNone,
	WYPlane,
	WYTrain,
	WYCar
} WYTrafficType;

@interface WYMTraffic : NSObject {
	WYTrafficType _trafficType;
	NSDate *_takeOffTime;
	NSString *_takeOffTimeStr;
	NSString *_departurePlace;
	NSString *_destinationPlace;
	NSNumber *_trafficPrice;
	
		//for plane
	NSString *_flightNumberStr;
	
		//for train
	NSString *_trainNumberStr;
}

@property (nonatomic) WYTrafficType trafficType;
@property (nonatomic, strong) NSDate *takeOffTime;
@property (nonatomic, strong) NSString *takeOffTimeStr;
@property (nonatomic, strong) NSString *departurePlace;
@property (nonatomic, strong) NSString *destinationPlace;
@property (nonatomic, strong) NSNumber *trafficPrice;
@property (nonatomic, strong) NSString *flightNumberStr;
@property (nonatomic, strong) NSString *trainNumberStr;

- (id)initWithTrafficInfoDic:(NSDictionary *)infoDic;

@end
