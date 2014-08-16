//
//  WYNationButton.h
//  WeiYou
//
//  Created by owen on 8/16/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYNodeButton.h"
#import "WYSysNation.h"

@interface WYNationButton : WYNodeButton {
    WYSysNation *_sysNation;
}

@property (nonatomic, readonly) WYSysNation *sysNation;

- (id)initButtonWithNation:(WYSysNation *)nation atIndex:(int)index;

@end
