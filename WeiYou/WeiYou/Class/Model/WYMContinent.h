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
	
	NSString *_continentID;
	NSString *_continentName;
	NSString *_continentDescription;
}

@property (nonatomic) WYContinent continentType;

@property (nonatomic, strong) NSString *continentID;
@property (nonatomic, strong) NSString *continentName;
@property (nonatomic, strong) NSString *continentDescription;

- (id)initWithContinentInfoDic:(NSDictionary *)infoDic;
- (NSDictionary *)transferToDic;
- (NSArray *)getAllCountries;

@end
