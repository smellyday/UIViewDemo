//
//  WYFakeNavBar.m
//  WeiYou
//
//  Created by zhangpan on 14-7-31.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYFakeNavBar.h"
#import "consts.h"

@implementation WYFakeNavBar
@synthesize bgImgView = _bgImgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        self.frame = NAV_BAR_CONTAINER_FRAME;
        self.bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_H+NAV_BAR_H)];
        [_bgImgView setImage:[UIImage imageNamed:PIC_NAV_BAR_BG]];
        [self addSubview:_bgImgView];
    }
    return self;
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
