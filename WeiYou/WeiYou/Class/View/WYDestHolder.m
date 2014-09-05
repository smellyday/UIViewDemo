//
//  WYDestHolder.m
//  WeiYou
//
//  Created by zhangpan on 14-9-5.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYDestHolder.h"
#import "consts.h"

@implementation WYDestHolder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initDestHolder {
    CGFloat h = 50;
    self = [self initWithFrame:CGRectMake(0, SCREEN_HEIGHT-h, SCREEN_WIDTH, h)];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

- (void)checkDestArr {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
