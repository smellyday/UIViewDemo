//
//  WYMTrip.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMTrip : NSObject {
	NSString *_tripName;
	NSString *_tripDescription;
	UIImage *_tripMainImage;
	NSDate *_tripBeginDate;
	NSDate *_tripEndDate;
	NSMutableArray *_tripDaysArray;
	NSMutableArray *_tripPrepareArray;
}

@property (nonatomic, strong) NSString *tripName;
@property (nonatomic, strong) NSString *tripDescription;
@property (nonatomic, strong) UIImage *tripMainImage;
@property (nonatomic, strong) NSDate *tripBeginDate;
@property (nonatomic, strong) NSDate *tripEndDate;
@property (nonatomic, strong) NSMutableArray *tripDaysArray;
@property (nonatomic, strong) NSMutableArray *tripPrepareArray;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic;

@end
