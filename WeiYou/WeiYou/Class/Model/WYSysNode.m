//
//  WYSysNode.m
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"

@implementation WYSysNode
@synthesize sysMID = _sysMID;
@synthesize sysParentID = _sysParentID;
@synthesize sysNodeName = _sysNodeName;
@synthesize sysNodeType = _sysNodeType;
@synthesize sysChildArray = _sysChildArray;

- (id)initNodeWithInfo:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		if (infoDic) {
            
			_sysMID = [[infoDic objectForKey:WY_NODE_ID] intValue];
            _sysParentID = [[infoDic objectForKey:WY_NODE_PARENT_ID] intValue];
            _sysNodeName = [[infoDic objectForKey:WY_NODE_NAME] objectForKey:WY_NODE_NAME_ZHCH];
            NSString *typeName = [infoDic objectForKey:WY_NODE_TYPE];
            if ([typeName isEqual:REGION_EARTH]) {
                _sysNodeType = 0;
            } else if ([typeName isEqual:REGION_CONTINENT]) {
                _sysNodeType = 10;
            } else if ([typeName isEqual:REGION_NATION]) {
                _sysNodeType = 20;
            } else if ([typeName isEqual:REGION_CITY]) {
                _sysNodeType = 30;
            } else if ([typeName isEqual:REGION_SPOT]) {
                _sysNodeType = 40;
            }

		} else {
            
			_sysMID = 0;
			_sysParentID = -1;
			_sysNodeType = 0;

        }
		
		self.sysChildArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}

@end
