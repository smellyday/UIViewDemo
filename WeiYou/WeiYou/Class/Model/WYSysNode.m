//
//  WYSysNode.m
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "consts.h"

@implementation WYSysNode
@synthesize mID = _mID;
@synthesize pID = _pID;
@synthesize nodeType = _nodeType;
@synthesize pSysNode = _pSysNode;
@synthesize childArray = _childArray;

- (id)initNodeWithInfo:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		if (infoDic) {
			_mID = [[infoDic objectForKey:WY_NODE_ID] intValue];
			_pID = [[infoDic objectForKey:WY_NODE_PARENT_ID] intValue];
			_nodeType = [infoDic objectForKey:WY_NODE_REGION_LEVEL];
			_nodeName = [[infoDic objectForKey:WY_NODE_NAME] objectForKey:WY_NODE_NAME_ZHCH];
		} else {
			_mID = 0;
			_pID = -1;
			_nodeType = REGION_EARTH;
		}
		
		self.pSysNode = nil;
		self.childArray = [NSMutableArray arrayWithCapacity:10];
	}
	
	return self;
}

@end
