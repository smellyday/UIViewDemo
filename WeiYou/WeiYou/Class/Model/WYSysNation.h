//
//  WYSysNation.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysContinent.h"

@interface WYSysNation : WYSysNode {
    WYSysContinent * __weak _sysParentContinent;
}

@property (nonatomic, weak) WYSysContinent *sysParentContinent;

- (id)initNationWithInfo:(NSDictionary *)infoDic;
- (NSString *)fetchNationBriefDescription;
- (NSArray *)fetchNationImages;
- (NSArray *)loadSysAllCitiesInTheNation;

@end
