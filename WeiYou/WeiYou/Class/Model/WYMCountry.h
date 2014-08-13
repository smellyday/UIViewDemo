//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCountry : NSObject {
	NSNumber *_countryID;
	NSNumber *_parentID;
	NSNumber *_level;
	NSString *_countryName;
}

@property (nonatomic, readonly) NSNumber *countryID;
@property (nonatomic, readonly) NSNumber *parentID;
@property (nonatomic, readonly) NSNumber *level;
@property (nonatomic, readonly) NSString *countryName;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllCities;

@end
