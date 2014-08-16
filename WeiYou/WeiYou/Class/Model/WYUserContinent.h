//
//  WYUserContinent.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"
#import "WYUserEarth.h"
#import "WYSysContinent.h"

@interface WYUserContinent : WYUserNode {
	WYSysContinent *_corSysContinent;
}

@property (nonatomic, readonly) WYSysContinent *corSysContinent;
@property (nonatomic, weak) WYUserEarth *pUserNode;

- (id)initWithSysContinent:(WYSysContinent *)sysContinent;

@end
