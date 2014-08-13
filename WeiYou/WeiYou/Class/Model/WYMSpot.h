//
//  WYMSpot.h
//  WeiYou
//
//  Created by owen on 7/3/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMContinent.h"
#import "WYMCountry.h"
#import "WYMCity.h"

@interface WYMSpot : NSObject {
	NSString *_spotID;
	NSNumber *_spotOrder;
	NSString *_spotName;
	NSString *_spotAddress;
	NSString *_spotInfo;
	
	NSArray *_spotWebsiteArray;
	NSArray *_spotImageURLArray;
	
	WYMCity *_spotCity;
	WYMCountry *_spotCountry;
	WYMContinent *_spotContinent;
}

@property (nonatomic, strong) NSString *spotID;
@property (nonatomic, strong) NSNumber *spotOrder;
@property (nonatomic, strong) NSString *spotName;
@property (nonatomic, strong) NSString *spotAddress;
@property (nonatomic, strong) NSString *spotInfo;

@property (nonatomic, strong) NSArray *spotWebsiteArray;
@property (nonatomic, strong) NSArray *spotImageURLArray;

@property (nonatomic, strong) WYMCity *spotCity;
@property (nonatomic, strong) WYMCountry *spotCountry;
@property (nonatomic, strong) WYMContinent *spotContinent;

- (id)initWithSpotInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;

@end
