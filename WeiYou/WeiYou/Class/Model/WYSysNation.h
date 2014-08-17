//
//  WYSysNation.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysContinent.h"

@interface WYSysNation : WYSysNode

@property (nonatomic, weak) WYSysContinent *pSysNode;

- (id)initNationWithInfo:(NSDictionary *)infoDic;

@end
