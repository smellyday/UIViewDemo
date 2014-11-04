//
//  WYSysArea.h
//  WeiYou
//
//  This is an abstract class, stand for a level.
//
//  Created by zhangpan on 14-9-18.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYSysNode.h"
#import "WYSysNation.h"

@interface WYSysArea : WYSysNode {
    WYSysNation * __weak _sysParentNation;
}

@property (nonatomic, weak) WYSysNation *sysParentNation;

- (void)loadSysAllSpotsInTheArea;

@end
