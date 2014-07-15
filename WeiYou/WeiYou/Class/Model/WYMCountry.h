//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCountry : NSObject {
	NSString *_countryID;
	NSString *_countryName;
	NSString *_countryDescription;
}

@property (nonatomic, strong) NSString *countryID;
@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *countryDescription;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllProvinces;
- (NSArray *)getAllCities;

@end
