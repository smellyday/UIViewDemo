//
//  WYMContinent.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	WYAsia,
	WYEurope,
	WYNorthAmerica,
	WYSouthAmeria,
	WYAustralia,
	WYAfrica,
	WYAntarctica
} WYContinent;

@interface WYMContinent : NSObject {
	WYContinent _continentType;
	
	NSNumber *_continentID;
	NSNumber *_parentID;
	NSNumber *_level;
	NSString *_continentName;
}

@property (nonatomic) WYContinent continentType;

@property (nonatomic, readonly) NSNumber *continentID;
@property (nonatomic, readonly) NSNumber *parentID;
@property (nonatomic, readonly) NSNumber *level;
@property (nonatomic, readonly) NSString *continentName;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllCountries;

@end
