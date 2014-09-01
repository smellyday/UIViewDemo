//
//  WYMTrip.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserDestinations.h"

@interface WYMTrip : NSObject {
	
	NSNumber *_tripID;
	NSNumber *_tripVersion;
	NSNumber *_tripDayth;
	NSString *_tripName;
	NSString *_tripDescription;
	NSString *_tripMainImageURL;
	NSDate *_tripBeginDate;
	NSDate *_tripEndDate;
	NSDate *_tripCreateDate;
//	NSMutableArray *_tripDaysArray;
	WYUserDestinations *_userDestinationAgent;
	
	BOOL _isNewTrip;
	BOOL _deletTrip;
	BOOL _shouldUpdate;
	BOOL _changeWhenUploading;
    
}

@property (nonatomic, strong) NSNumber *tripID;
@property (nonatomic, strong) NSNumber *tripVersion;
@property (nonatomic, strong) NSNumber *tripDayth;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripDescription;
@property (nonatomic, strong) NSString *tripMainImageURL;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSDate *tripCreateDate;
//@property (nonatomic, readonly) NSMutableArray *tripDaysArray;
@property (nonatomic, strong) WYUserDestinations *userDestinationAgent;

@property (nonatomic) BOOL isNewTrip;
@property (nonatomic) BOOL deletTrip;
@property (nonatomic) BOOL shouldUpdate;
@property (nonatomic) BOOL changeWhenUploading;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic;

- (void)addNewTripToServer;
- (void)deleteTripFromServer;
- (void)updateTripInfoToServer;
- (void)updateTripInfoFromServer;

- (NSDictionary *)transferToDic;

@end
