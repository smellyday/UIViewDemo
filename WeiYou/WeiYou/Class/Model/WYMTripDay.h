//
//  WYMTripDay.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTripDay : NSObject {
    /*
	NSMutableArray *_continentsArray;
	NSMutableArray *_hotelsArray; // item WYMBookedHotel
	NSMutableArray *_trafficArray;
     */
	
		//dic info
	NSNumber *_dayTH;
	NSMutableArray *_spotsArray;
	
		//date
	NSDate *_date;
	NSString *_dateStr;
	NSString *_weekDayStr;
	NSString *_dayTHStr;
}

@property (nonatomic, strong) NSNumber *dayTH;
@property (nonatomic, strong) NSMutableArray *spotsArray;

@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *weekDayStr;
@property (nonatomic, strong) NSString *dayTHStr;

/*
@property (nonatomic, strong) NSMutableArray *continentsArray;
@property (nonatomic, strong) NSMutableArray *hotelsArray;
@property (nonatomic, strong) NSMutableArray *trafficArray;
 */

- (id)initTripDayInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;

@end
