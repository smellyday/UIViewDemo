//
//  WYNationButton.m
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYNationButton.h"

@implementation WYNationButton
@synthesize sysNation = _sysNation;


- (id)initButtonWithNation:(WYSysNation *)nation atIndex:(int)index {
	self = [super initButtonWithNodeName:nation.nodeName atIndex:index];
	if (self) {
		_sysNation = nation;
	}
	
	return self;
}





@end
