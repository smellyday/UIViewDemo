//
//  WYMCity.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCity : NSObject {
	NSNumber *_cityID;
	NSNumber *_parentID;
	NSNumber *_level;
	NSString *_cityName;
}

@property (nonatomic, readonly) NSNumber *cityID;
@property (nonatomic, readonly) NSNumber *parentID;
@property (nonatomic, readonly) NSNumber *level;
@property (nonatomic, readonly) NSString *cityName;

- (id)initWithCityInfoDic:(NSDictionary *)infoDic;

- (NSArray *)getAllSpots;
- (NSDictionary *)transferToDic;
@end
