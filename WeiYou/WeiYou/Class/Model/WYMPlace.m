//
//  WYMPlace.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYMPlace.h"
#import "consts.h"

@implementation WYMPlace
@synthesize ID = _ID;
@synthesize parentID = _parentID;
@synthesize name = _name;

- (id)initWithInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
        _ID = [infoDic objectForKey:WY_PLACE_ID];
        _parentID = [infoDic objectForKey:WY_PLACE_PARENT_ID];
        _name = [[infoDic objectForKey:WY_PLACE_NAME] objectForKey:WY_NAME_ZHCH];
	}
	return self;
}

// create a clean place.
- (id)initWithID:(NSNumber *)mid parentID:(NSNumber *)pid name:(NSString *)mname {
    self = [super init];
	if (self) {
        _ID = mid;
        _parentID = pid;
        _name = mname;
	}
	return self;
}

- (id)initWithOtherPlace:(WYMPlace *)place {
    self = [super init];
	if (self) {
        _ID = place.ID;
        _parentID = place.parentID;
        _name = place.name;
	}
	return self;
}

@end
