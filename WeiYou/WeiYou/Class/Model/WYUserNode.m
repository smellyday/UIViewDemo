//
//  WYUserNode.m
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"

@implementation WYUserNode
@synthesize corSysNode = _corSysNode;
@synthesize pUserNode = _pUserNode;
@synthesize childArray = _childArray;

- (id)initWithSysUserNode:(WYSysNode *)sysNode {
	self = [super init];
	if (self) {
		_corSysNode = sysNode;
		self.pUserNode = nil;
		self.childArray = [NSMutableArray arrayWithCapacity:10];
	}

	return self;
}

@end
