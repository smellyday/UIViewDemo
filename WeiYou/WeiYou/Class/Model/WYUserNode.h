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

@end
