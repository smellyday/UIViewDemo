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



- (NSUInteger)countOfChildArray {
    return [_childArray count];
}

- (WYUserNode *)objectInChildArrayAtIndex:(NSUInteger)index {
    return [_childArray objectAtIndex:index];
}

- (NSArray *)childArrayAtIndexes:(NSIndexSet *)indexes {
    return [_childArray objectsAtIndexes:indexes];
}

- (void)insertObject:(WYUserNode *)object inChildArrayAtIndex:(NSUInteger)index {
    [_childArray insertObject:object atIndex:index];
}

- (void)insertChildArray:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    [_childArray insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromChildArrayAtIndex:(NSUInteger)index {
    [_childArray removeObjectAtIndex:index];
}

- (void)removeChildArrayAtIndexes:(NSIndexSet *)indexes {
    [_childArray removeObjectsAtIndexes:indexes];
}

- (void)removeChildArrayObject:(WYUserNode *)object {
    [_childArray removeObject:object];
}

@end
