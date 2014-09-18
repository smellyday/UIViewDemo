//
//  WYSysSpot.h
//  WeiYou
//
//  Created by zhangpan on 14-9-18.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysArea.h"

@interface WYSysSpot : WYSysNode

@property (nonatomic, weak) WYSysArea *pSysNode;

- (id)initSpotWithInfo:(NSDictionary *)infoDic;

@end
