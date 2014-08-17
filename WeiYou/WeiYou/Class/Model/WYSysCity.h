//
//  WYSysCity.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysNation.h"

@interface WYSysCity : WYSysNode

@property (nonatomic, weak) WYSysNation *pSysNode;

- (id)initCityWithInfo:(NSDictionary *)infoDic;


@end
