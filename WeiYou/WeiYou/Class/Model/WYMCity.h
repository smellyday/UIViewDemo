//
//  WYMCity.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCity : NSObject {
	NSString *_cityID;
	NSString *_cityName;
	NSString *_cityDescription;
}

@property (nonatomic, strong) NSString *cityID;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityDescription;

- (id)initWithCityInfoDic:(NSDictionary *)infoDic;
- (NSArray *)getAllSpots;

@end
