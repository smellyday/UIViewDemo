//
//  WYSysNode.h
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYSysNode : NSObject {
    NSInteger _mID;
	NSInteger _pID;
	NSString *_nodeType;
	NSString *_nodeName;
	
    WYSysNode * __weak _pSysNode;
	NSMutableArray *_childArray;
}

@property (nonatomic, readonly) NSInteger mID;
@property (nonatomic, readonly) NSInteger pID;
@property (nonatomic, readonly) NSString *nodeType;
@property (nonatomic, readonly)	NSString *nodeName;
@property (nonatomic, weak) WYSysNode *pSysNode;
@property (nonatomic, strong) NSMutableArray *childArray;

- (id)initNodeWithInfo:(NSDictionary *)infoDic;

@end
