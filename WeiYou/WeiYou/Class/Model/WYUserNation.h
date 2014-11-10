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
    WYUserContinent * __weak _userParentContinent;
    
    NSMutableArray *_userCitiesArray;
}

@property (nonatomic, readonly) WYSysNation *corSysNation;
@property (nonatomic, weak) WYUserContinent *userParentContinent;
@property (nonatomic, strong) NSMutableArray *userCitiesArray;


#pragma -- init
- (id)initWithSysNation:(WYSysNation *)sysNation;

@end
