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
	WYSysEarth * __weak _pSysEarth;
}

@property (nonatomic, weak) WYSysEarth *pSysEarth;

- (id)initContinentWithInfo:(NSDictionary *)infoDic;


@end