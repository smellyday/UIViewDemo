//
//  WYSysNode.h
//  WeiYou
//
//  Created by owen on 8/15/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "consts.h"

@interface WYSysNode : NSObject {
    NSInteger _sysMID;
    NSInteger _sysParentID;
    NSString *_sysNodeName;
    
	WYNodeType _sysNodeType;
	NSMutableArray *_sysChildArray;
}

@property (nonatomic, readonly) NSInteger sysMID;
@property (nonatomic, readonly) NSInteger sysParentID;
@property (nonatomic, readonly)	NSString *sysNodeName;
@property (nonatomic, readonly) WYNodeType sysNodeType;
@property (nonatomic, strong) NSMutableArray *sysChildArray;

- (id)initNodeWithInfo:(NSDictionary *)infoDic;

@end
