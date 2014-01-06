//
//  WYCMContinent.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMCountry, WYCMTripDay;

@interface WYCMContinent : NSManagedObject

@property (nonatomic, retain) NSString * continentDes;
@property (nonatomic, retain) NSNumber * continentType;
@property (nonatomic, retain) WYCMTripDay *tripDay;
@property (nonatomic, retain) NSSet *countries;
@end

@interface WYCMContinent (CoreDataGeneratedAccessors)

- (void)addCountriesObject:(WYCMCountry *)value;
- (void)removeCountriesObject:(WYCMCountry *)value;
- (void)addCountries:(NSSet *)values;
- (void)removeCountries:(NSSet *)values;

- (void)prepareContinentInfoWith:(NSDictionary *)infoDic;

@end
