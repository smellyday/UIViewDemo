//
//  WYMTrip.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTrip : NSObject {
	NSString *_tripID;
	NSString *_tripName;
	NSString *_tripDescription;
	NSString *_tripMainImageURL;
	NSDate *_tripBeginDate;
	NSDate *_tripEndDate;
	NSDate *_tripCreateDate;
	NSMutableArray *_tripDaysArray;

}

@property (nonatomic, strong) NSString *tripID;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripDescription;
@property (nonatomic, strong) NSString *tripMainImageURL;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSDate *tripCreateDate;
@property (nonatomic, strong) NSMutableArray *tripDaysArray;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;

@end
