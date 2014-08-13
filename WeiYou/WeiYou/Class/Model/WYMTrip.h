//
//  WYMTrip.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYMCity, WYMSpot;
@interface WYMTrip : NSObject {
	
	NSNumber *_tripID;
	NSNumber *_tripVersion;
	NSNumber *_tripOrder;
	NSString *_tripName;
	NSString *_tripDescription;
	NSString *_tripMainImageURL;
	NSDate *_tripBeginDate;
	NSDate *_tripEndDate;
	NSDate *_tripCreateDate;
	NSMutableArray *_tripDaysArray;
	NSMutableArray *_tripContinentsArray;
	NSMutableArray *_tripCountriesArray;
	NSMutableArray *_tripCitiesArray;
	
	BOOL _isNewTrip;
	BOOL _deletTrip;
	BOOL _shouldUpdate;
	BOOL _changeWhenUploading;
}

@property (nonatomic, strong) NSNumber *tripID;
@property (nonatomic, strong) NSNumber *tripVersion;
@property (nonatomic, strong) NSNumber *tripOrder;
@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripDescription;
@property (nonatomic, strong) NSString *tripMainImageURL;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSDate *tripCreateDate;
@property (nonatomic, readonly) NSMutableArray *tripDaysArray;
@property (nonatomic, readonly) NSMutableArray *tripContinentsArray;
@property (nonatomic, readonly) NSMutableArray *tripCountriesArray;
@property (nonatomic, readonly) NSMutableArray *tripCitiesArray;

@property (nonatomic) BOOL isNewTrip;
@property (nonatomic) BOOL deletTrip;
@property (nonatomic) BOOL shouldUpdate;
@property (nonatomic) BOOL changeWhenUploading;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic;

- (void)addNewTripToServer;
- (void)deleteTripFromServer;
- (void)updateTripInfoToServer;
- (void)updateTripInfoFromServer;

	//edit
- (void)addCity:(WYMCity *)city;
- (void)delCity:(WYMCity *)city;
- (void)addSpot:(WYMSpot *)spot;
- (void)delSpot:(WYMSpot *)spot;

- (NSDictionary *)transferToDic;

@end
