//
//  WYMRoom.h
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYMRoom : NSObject {
	NSString *_roomTypeName;
	NSNumber *_roomPrice;    // float
	NSNumber *_roomDimension;// float
	NSNumber *_roomFloor;    // unsinged int
	NSNumber *_roomCapacity; // unsinged int How many people could live in?
}

@property (nonatomic, strong) NSString *roomTypeName;
@property (nonatomic, strong) NSNumber *roomPrice;
@property (nonatomic, strong) NSNumber *roomDimension;
@property (nonatomic, strong) NSNumber *roomFloor;
@property (nonatomic, strong) NSNumber *roomCapacity;

- (id)initWithRoomInfoDic:(NSDictionary *)infoDic;

@end
