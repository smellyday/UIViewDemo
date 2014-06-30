//
//  WYCoreDataDAO.h
//  WeiYou
//
//  Created by zhangpan on 14-6-30.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYMTrip, WYMTripDay;

@interface WYCoreDataDAO : NSObject {
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
}

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedCoreDataDAO;

// trip
- (int)createTrip:(WYMTrip *)trip;
- (int)removeTrip:(WYMTrip *)trip;
- (int)modifyTrip:(WYMTrip *)trip;
- (NSArray *)findAllTrips;

// tripDay
- (int)createTripDay:(WYMTripDay *)tripDay;
- (int)removeTripDay:(WYMTripDay *)tripDay;
- (int)modifyTripDay:(WYMTripDay *)tripDay;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
