//
//  WYSysSpot.h
//  WeiYou
//
//  Created by zhangpan on 14-9-18.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysCity.h"

@interface WYSysSpot : WYSysNode {
    WYSysCity * __weak _sysParentCity;
}

@property (nonatomic, weak) WYSysCity *sysParentCity;

- (id)initSpotWithInfo:(NSDictionary *)infoDic;

@end
