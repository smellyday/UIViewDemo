//
//  WYSysEarth.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYSysEarth.h"
#import "WYSysContinent.h"

@implementation WYSysEarth
@synthesize sysParentNode = _sysParentNode;

- (id)initEarth {
	self = [super initNodeWithInfo:nil];
	if (self) {
        self.sysParentNode = nil;
        [self loadSysAllContinents];
	}
	
	return self;
}

#pragma -- private method.
- (void)loadSysAllContinents {
    NSString *PlistPath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"plist"];
    NSArray *fileArr = [NSArray arrayWithContentsOfFile:PlistPath];
    for (NSDictionary *continentInfoDic in fileArr) {
        WYSysContinent *continent = [[WYSysContinent alloc] initContinentWithInfo:continentInfoDic];
        continent.sysParentEarth = self;
        [self.sysChildArray addObject:continent];
    }
}

@end
