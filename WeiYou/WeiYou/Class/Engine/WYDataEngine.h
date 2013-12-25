//
//  WYDataEngine.h
//  WeiYou
//
//  Created by owen on 11/22/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYDataEngine : NSObject {
	NSMutableArray *_trips;
}

@property (nonatomic, strong) NSMutableArray *trips;

+ (id)sharedDataEngine;

- (NSArray *)getTrips;
- (NSArray *)getCityArray;

@end
