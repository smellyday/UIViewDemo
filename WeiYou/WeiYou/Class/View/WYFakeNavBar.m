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
@synthesize title = _title;
@synthesize titleLabel = _titleLabel;

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
//        UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUS_BAR_H+NAV_BAR_H)];
//        [bgImgView setImage:[UIImage imageNamed:PIC_NAV_BAR_BG]];
//        [self addSubview:bgImgView];
//        
//        CGFloat width = 200.0;
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-width)/2, STATUS_BAR_H, width, NAV_BAR_BTN_H)];
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:_titleLabel];
    }
    
    return self;
}

- (void)drawBubbleButtonWithFrame: (CGRect)frame
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.642 blue: 0.099 alpha: 1];
    UIColor* backgroundColor = [UIColor colorWithRed: 1 green: 0.941 blue: 0.859 alpha: 1];
    
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 53) * 0.50000 + 0.5), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 45, 53, 38);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 14.2, CGRectGetMinY(frame) + 9.15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 13.81, CGRectGetMinY(frame) + 9.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.25, CGRectGetMinY(frame) + 14.81) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 11.23, CGRectGetMinY(frame) + 10.19) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 9.19, CGRectGetMinY(frame) + 12.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMinY(frame) + 23.79) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMinY(frame) + 17.18) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMinY(frame) + 19.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMaxY(frame) - 41.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.15, CGRectGetMaxY(frame) - 33.2) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMaxY(frame) - 37.38) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 7.5, CGRectGetMaxY(frame) - 35.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 8.25, CGRectGetMaxY(frame) - 32.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 13.81, CGRectGetMaxY(frame) - 27.25) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 9.19, CGRectGetMaxY(frame) - 30.23) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 11.23, CGRectGetMaxY(frame) - 28.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 22.79, CGRectGetMaxY(frame) - 26.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 16.18, CGRectGetMaxY(frame) - 26.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 18.38, CGRectGetMaxY(frame) - 26.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 40.37, CGRectGetMaxY(frame2) - 19.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 5.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 33.47, CGRectGetMaxY(frame2) - 12.6) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 5.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame2) + 12.37, CGRectGetMaxY(frame2) - 19.5) controlPoint1: CGPointMake(CGRectGetMinX(frame2) + 26.37, CGRectGetMaxY(frame2) - 5.5) controlPoint2: CGPointMake(CGRectGetMinX(frame2) + 19.27, CGRectGetMaxY(frame2) - 12.6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.79, CGRectGetMaxY(frame) - 26.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 14.2, CGRectGetMaxY(frame) - 27.15) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.38, CGRectGetMaxY(frame) - 26.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 16.18, CGRectGetMaxY(frame) - 26.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 13.81, CGRectGetMaxY(frame) - 27.25)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8.25, CGRectGetMaxY(frame) - 32.81) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 11.23, CGRectGetMaxY(frame) - 28.19) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 9.19, CGRectGetMaxY(frame) - 30.23)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMaxY(frame) - 41.79) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMaxY(frame) - 35.18) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMaxY(frame) - 37.38)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMinY(frame) + 23.79)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 8.15, CGRectGetMinY(frame) + 15.2) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMinY(frame) + 19.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 7.5, CGRectGetMinY(frame) + 17.18)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 8.25, CGRectGetMinY(frame) + 14.81)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 13.81, CGRectGetMinY(frame) + 9.25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 9.19, CGRectGetMinY(frame) + 12.23) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 11.23, CGRectGetMinY(frame) + 10.19)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.79, CGRectGetMinY(frame) + 8.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 16.18, CGRectGetMinY(frame) + 8.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.38, CGRectGetMinY(frame) + 8.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 22.79, CGRectGetMinY(frame) + 8.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 14.2, CGRectGetMinY(frame) + 9.15) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 18.38, CGRectGetMinY(frame) + 8.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 16.18, CGRectGetMinY(frame) + 8.5)];
    [bezierPath closePath];
    [backgroundColor setFill];
    [bezierPath fill];
    [color setStroke];
    bezierPath.lineWidth = 3;
    [bezierPath stroke];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawBubbleButtonWithFrame:rect];
}

@end
