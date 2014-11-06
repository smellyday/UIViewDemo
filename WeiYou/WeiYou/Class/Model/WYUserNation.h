//
//  WYUserNation.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYUserNode.h"
#import "WYUserContinent.h"
#import "WYSysNation.h"

@interface WYUserNation : WYUserNode {
    WYSysNation *_corSysNation;
    WYSysContinent * __weak
    
    NSDate *_beginDate;
    NSDate *_endDate;
    
}

@property (nonatomic, strong) NSDate *beginDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, readonly) WYSysNation *corSysNation;
@property (nonatomic, weak) WYUserContinent *pUserNode;

- (id)initWithSysNation:(WYSysNation *)sysNation;

@end
