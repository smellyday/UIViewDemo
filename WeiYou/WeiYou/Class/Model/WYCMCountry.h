//
//  WYCMCountry.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMCity;

@interface WYCMCountry : NSManagedObject

@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) NSString * countryDes;
@property (nonatomic, retain) NSManagedObject *continent;
@property (nonatomic, retain) NSSet *cities;
@end

@interface WYCMCountry (CoreDataGeneratedAccessors)

- (void)addCitiesObject:(WYCMCity *)value;
- (void)removeCitiesObject:(WYCMCity *)value;
- (void)addCities:(NSSet *)values;
- (void)removeCities:(NSSet *)values;

@end
