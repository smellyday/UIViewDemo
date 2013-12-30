//
//  WYCMCity.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WYCMCity : NSManagedObject

@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSString * cityDes;
@property (nonatomic, retain) NSString * briefName;
@property (nonatomic, retain) NSManagedObject *country;
@property (nonatomic, retain) NSSet *spots;
@end

@interface WYCMCity (CoreDataGeneratedAccessors)

- (void)addSpotsObject:(NSManagedObject *)value;
- (void)removeSpotsObject:(NSManagedObject *)value;
- (void)addSpots:(NSSet *)values;
- (void)removeSpots:(NSSet *)values;

@end
