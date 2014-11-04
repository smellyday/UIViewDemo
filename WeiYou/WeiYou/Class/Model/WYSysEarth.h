//
//  WYSysEarth.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysNode.h"

@interface WYSysEarth : WYSysNode {
    WYSysNode * __weak _sysParentNode;
}

@property (nonatomic, weak) WYSysNode *sysParentNode;

- (id)initEarth;

@end
