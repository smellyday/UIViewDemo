//
//  WYCoreDataEngine.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCoreDataEngine : NSObject {
    UIManagedDocument *_managedDocument;
    NSManagedObjectContext *_context;
    NSMutableArray *_tripsArray;
    NSURL *_coreDataURL;
    
    BOOL _dataOK;
}

@property (nonatomic, strong) UIManagedDocument *managedDocument;
@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) NSMutableArray *tripsArray;
@property (nonatomic, strong) NSURL *coreDataURL;
@property (nonatomic) BOOL dataOK;

+ (id)sharedCoreDataEngine;
- (void)open;
- (void)save;
- (void)close;
- (void)initTrips;

@end
