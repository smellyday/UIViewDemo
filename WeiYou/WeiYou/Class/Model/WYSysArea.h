//
//  WYSysArea.h
//  WeiYou
//
//  Created by zhangpan on 14-9-18.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysNation.h"

@interface WYSysArea : WYSysNode

@property (nonatomic, weak) WYSysNation *pSysNode;

- (id)initAreaWithInfo:(NSDictionary *)infoDic;

@end
