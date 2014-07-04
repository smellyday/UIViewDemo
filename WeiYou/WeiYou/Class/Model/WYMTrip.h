//
//  WYMTrip.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTrip : NSObject {

	NSNumber *_tripVersion;
	NSNumber *_tripOrder;
	NSString *_tripID;
	NSString *_tripName;
	NSString *_tripDescription;
	NSString *_tripMainImageURL;
	NSDate *_tripBeginDate;
	NSDate *_tripEndDate;
	NSDate *_tripCreateDate;
	NSMutableArray *_tripDaysArray;
	
	BOOL _isNewTrip;
	BOOL _deletTrip;
	BOOL _shouldUpdate;
	
	BOOL _changeWhenUploading;
}

@property (nonatomic, strong) NSNumber *tripVersion;
@property (nonatomic, strong) NSNumber *tripOrder;
@property (nonatomic, strong) NSString *tripID;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripDescription;
@property (nonatomic, strong) NSString *tripMainImageURL;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSDate *tripCreateDate;
@property (nonatomic, strong) NSMutableArray *tripDaysArray;

@property (nonatomic) BOOL isNewTrip;
@property (nonatomic) BOOL deletTrip;
@property (nonatomic) BOOL shouldUpdate;
@property (nonatomic) BOOL changeWhenUploading;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic;

- (void)synchronizeWithServer;
- (NSDictionary *)transferToDic;

@end
