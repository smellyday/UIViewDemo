//
//  WYSysContinent.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysEarth.h"

@interface WYSysContinent : WYSysNode {
    WYSysEarth * __weak _sysParentEarth;
    NSDictionary *_continentInfoDic;
}

@property (nonatomic, weak) WYSysEarth *sysParentEarth;
@property (nonatomic, strong) NSDictionary *continentInfoDic;

- (id)initContinentWithInfo:(NSDictionary *)infoDic;
- (NSString *)fetchContinentBriefDescription;
- (NSArray *)fetchContinentImages;

@end
