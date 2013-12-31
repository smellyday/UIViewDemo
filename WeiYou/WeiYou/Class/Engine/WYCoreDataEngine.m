//
//  WYCoreDataEngine.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCoreDataEngine.h"
#import "WYCMTrip.h"
#import "consts.h"

@implementation WYCoreDataEngine
@synthesize managedDocument = _managedDocument;
@synthesize context = _context;
@synthesize tripsArray = _tripsArray;
@synthesize coreDataURL = _coreDataURL;
@synthesize dataOK = _dataOK;

+ (id)sharedCoreDataEngine {
    static WYCoreDataEngine *sharedCore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCore = [[self alloc] init];
    });
	
	return sharedCore;
}

- (void)open {
    NSArray *userDomainArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dataFilePath = [NSString stringWithFormat:@"%@/%@", [userDomainArray objectAtIndex:0], @"tripCoreData"];
    self.coreDataURL = [[NSURL alloc] initFileURLWithPath:dataFilePath];
    self.managedDocument = [[UIManagedDocument alloc] initWithFileURL:_coreDataURL];
    self.context = self.managedDocument.managedObjectContext;
    self.dataOK = NO;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[_coreDataURL path]]) {
        
        [_managedDocument openWithCompletionHandler:^(BOOL success){
            
            if (success) {
                mlog(@"open core data success");
                [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(initData) userInfo:nil repeats:NO];
            } else {
                mlog(@"open core data fail");
            }
            
        }];
        
    } else {
        
        [_managedDocument saveToURL:_coreDataURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success){
            
            if (success) {
                mlog(@"create core data success");
                [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(initData) userInfo:nil repeats:NO];
            } else {
                mlog(@"create core data fail");
            }
            
        }];
        
    }
    
}

- (void)initData {
    [self initTrips];
}

- (void)save {
    [self.managedDocument saveToURL:_coreDataURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success){
        if (success) {
            mlog(@"core data save success");
        } else {
            mlog(@"core data save fail");
        }
    }];
    
}

- (void)close {
    [_managedDocument closeWithCompletionHandler:^(BOOL success){
        if (success) {
            mlog(@"core data close success");
        } else {
            mlog(@"core data close failure");
        }
    }];
}

- (void)initTrips {
    self.tripsArray = [NSMutableArray arrayWithCapacity:10];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trips.plist" ofType:nil]];
	for (NSDictionary *dic in arr) {
		WYCMTrip *trip = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMTrip" inManagedObjectContext:self.context];
        [trip prepareTripWithInfo:dic];
        [self.tripsArray addObject:trip];
	}
    [self save];
    
    self.dataOK = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:WY_TRIPS_DATA_OK object:nil userInfo:nil];
}


@end
