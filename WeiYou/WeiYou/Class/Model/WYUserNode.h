//
//  WYUserNode.h
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysNode.h"

@interface WYUserNode : NSObject {
	WYSysNode *_corSysNode;
    WYUserNode * __weak _pUserNode;
    NSMutableArray *_childArray;
}

@property (nonatomic, readonly) WYSysNode *corSysNode;
@property (nonatomic, weak) WYUserNode *pUserNode;
@property (nonatomic, strong) NSMutableArray *childArray;

- (id)initWithSysUserNode:(WYSysNode *)sysNode;

- (NSUInteger)countOfChildArray;
- (WYUserNode *)objectInChildArrayAtIndex:(NSUInteger)index;
- (NSArray *)childArrayAtIndexes:(NSIndexSet *)indexes;
- (void)insertObject:(WYUserNode *)object inChildArrayAtIndex:(NSUInteger)index;
- (void)insertChildArray:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromChildArrayAtIndex:(NSUInteger)index;
- (void)removeChildArrayAtIndexes:(NSIndexSet *)indexes;
- (void)removeChildArrayObject:(WYUserNode *)object;

@end
