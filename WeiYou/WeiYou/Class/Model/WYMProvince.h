//
//  WYMProvince.h
//  WeiYou
//
//  Created by owen on 7/4/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMProvince : NSObject {
	NSString *_provinceID;
	NSString *_provinceName;
	NSString *_provinceDescription;
}

@property (nonatomic, strong) NSString *provinceID;
@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, strong) NSString *provinceDescription;

- (id)initWithProvinceInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllCities;

@end
