//
//  WYMCity.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCity : NSObject {
	NSString *_cityName;
	NSString *_briefName;
	NSString *_cityDes;
	NSMutableArray *_spotsArray;
}

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *briefName;
@property (nonatomic, strong) NSString *cityDes;
@property (nonatomic, strong) NSMutableArray *spotsArray;

- (id)initWithCityName:(NSString *)name;
- (id)initWithCityInfoDic:(NSDictionary *)infoDic;

@end
