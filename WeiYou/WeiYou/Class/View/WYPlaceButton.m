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
@synthesize thePlace = _thePlace;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initButtonWithPlace:(WYMPlace *)place atIndex:(int)index {
    CGFloat gapLeftW = 8.0;
    CGFloat gapMidW = 23.0;
    CGFloat gapTopH = 35.0;
    CGFloat gapMidH = 13.0;
    CGFloat w = 86.0;
    CGFloat h = 22.0;
    
    int wn = index % 3;
    int hn = index / 3;
    
    self = [self initWithFrame:CGRectMake(gapLeftW+wn*w+wn*gapMidW, gapTopH+hn*h+hn*gapMidH, w, h)];
    
    _thePlace = place;
    
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
