//
//  WYMTripDay.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTripDay : NSObject {
	//dic info
	NSNumber *_dayTH;
	NSMutableArray *_spots;
	
	//date
    NSDate *_tripBeginDate;
	NSDate *_date;
	NSString *_dateStr;
	NSString *_weekDayStr;
	NSString *_dayTHStr;
}

@property (nonatomic, strong) NSNumber *dayTH;
@property (nonatomic, strong) NSMutableArray *spots;

@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *weekDayStr;
@property (nonatomic, strong) NSString *dayTHStr;

- (id)initTripDayInfoDic:(NSDictionary *)infoDic;
- (void)updateDateInfoWithBeginDate:(NSDate *)mBeginDate;
- (void)updateDateInfoWithDayth:(NSNumber *)daythNum;
- (NSDictionary *)transferToDic;

@end
