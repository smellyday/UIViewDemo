//
//  WYMTripDay.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTripDay : NSObject {
	NSMutableArray *_continentsArray;
	NSMutableArray *_hotelsArray; // item WYMBookedHotel
	NSMutableArray *_trafficArray;
	
		//date
	NSDate *_date;
	NSString *_dateStr;
	NSString *_weekDayStr;
	
		//dayth
	NSNumber *_dayTH;
	NSString *_dayTHStr;
}

@property (nonatomic, strong) NSMutableArray *continentsArray;
@property (nonatomic, strong) NSMutableArray *hotelsArray;
@property (nonatomic, strong) NSMutableArray *trafficArray;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *weekDayStr;
@property (nonatomic, strong) NSNumber *dayTH;
@property (nonatomic, strong) NSString *dayTHStr;

- (id)initTripDayInfoDic:(NSDictionary *)infoDic;

@end
