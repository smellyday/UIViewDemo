//
//  WYSysCity.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysNation.h"

@interface WYSysCity : WYSysNode {
	WYSysNation * __weak _pSysNation;
}

@property (nonatomic, weak) WYSysNation *pSysNation;

- (id)initCityWithInfo:(NSDictionary *)infoDic;


@end
