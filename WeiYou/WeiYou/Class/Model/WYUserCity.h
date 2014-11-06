//
//  WYUserCity.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"
#import "WYUserNation.h"
#import "WYSysCity.h"

@interface WYUserCity : WYUserNode {
    WYSysCity *_corSysCity;
    
    NSDate *_beginDate;
    NSDate *_endDate;
    
}

@property (nonatomic, readonly) WYSysCity *corSysCity;
@property (nonatomic, weak) WYUserNation *pUserNode;

- (id)initWithSysCity:(WYSysCity *)sysCity;

@end
