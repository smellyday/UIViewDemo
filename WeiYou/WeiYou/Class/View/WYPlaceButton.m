//
//  WYPlaceButton.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYPlaceButton.h"
#import "consts.h"

@implementation WYPlaceButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initButtonWithPlace:(WYMPlace *)place atIndex:(int)index {
    CGFloat gapLeftW = 1.0;
    CGFloat gapTopH = 30.0;
    CGFloat w = 106.0;
    CGFloat h = 35.0;
    
    int wn = index % 3;
    int hn = index / 3;
    
    self = [self initWithFrame:CGRectMake(gapLeftW+wn*w, gapTopH+hn*h, w, h)];
    
    [self setTitleColor:COLOR_ON_PLACE_N forState:UIControlStateNormal];
    [self setTitleColor:COLOR_ON_PLACE_H forState:UIControlStateHighlighted];
    [self setTitleColor:COLOR_ON_PLACE_H forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageNamed:PIC_BTN_PLACE_N] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:PIC_BTN_PLACE_H] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageNamed:PIC_BTN_PLACE_H] forState:UIControlStateSelected];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    if (place) {
        [self setTitle:place.name forState:UIControlStateNormal];
    } else {
        [self setTitle:@"更多" forState:UIControlStateNormal];
    }
    
    self.titleEdgeInsets = UIEdgeInsetsMake(5, 15, 5, 15);
    
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
