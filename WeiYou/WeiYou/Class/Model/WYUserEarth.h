//
//  WYUserEarth.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"
#import "WYSysEarth.h"

@interface WYUserEarth : WYUserNode {
	WYSysEarth *_corSysEarth;
    NSMutableArray *_userContinentsArray;
}

@property (nonatomic, readonly) WYSysEarth *corSysEarth;
@property (nonatomic, strong) NSMutableArray *userContinentsArray;

#pragma -- init
- (id)initWithSysEarth:(WYSysEarth *)sysEarth;

@end
