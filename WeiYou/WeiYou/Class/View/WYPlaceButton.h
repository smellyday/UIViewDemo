//
//  WYPlaceButton.h
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYMPlace.h"


@interface WYPlaceButton : UIButton

- (id)initButtonWithPlace:(WYMPlace *)place atIndex:(int)index;

@end
