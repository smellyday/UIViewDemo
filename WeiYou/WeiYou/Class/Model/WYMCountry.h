//
//  WYMCountry.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMCountry : NSObject {
	NSString *_countryName;
	NSString *_countryDes;
	NSMutableArray *_cityArray;
}

@property (nonatomic, strong) NSString *countryName;
@property (nonatomic, strong) NSString *countryDes;
@property (nonatomic, strong) NSMutableArray *cityArray;

- (id)initWithCountryInfoDic:(NSDictionary *)infoDic;

@end
