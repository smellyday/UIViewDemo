//
//  WYSysNodeManager.h
//  WeiYou
//
//  Created by zhangpan on 14/11/4.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYSysEarth.h"
#import "WYSysContinent.h"
#import "WYSysNation.h"
#import "WYSysArea.h"
#import "WYSysSpot.h"

@interface WYSysNodeManager : NSObject {
    WYSysEarth *_sysEarthNode;
}

@property (nonatomic, strong, readonly) WYSysEarth *sysEarthNode;

- (id)initSysNodeTree;

- (NSArray *)getSysAllContinents;
- (NSArray *)getSysAllNationsInContinentWithID:(NSInteger)continentID;
- (NSArray *)getSysAllNationsInContinent:(WYSysContinent *)continent;

@end
