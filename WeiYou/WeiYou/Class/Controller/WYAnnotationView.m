//
//  WYAnnotationView.m
//  WeiYou
//
//  Created by owen on 12/24/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYAnnotationView.h"

@implementation WYAnnotationView
@synthesize calloutview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	if (self) {
        /*
		self.frame = CGRectMake(0, 0, 100, 100);
		self.backgroundColor = [UIColor clearColor];
		
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.frame = CGRectMake(50, 50, 50, 50);
		btn.backgroundColor = [UIColor redColor];
		[btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:btn];
        */
        
        self.calloutview = [[UIView alloc] initWithFrame:CGRectMake(0, -50, 200, 50)];
        self.calloutview.backgroundColor = [UIColor greenColor];
        
        UIButton *mb = [UIButton buttonWithType:UIButtonTypeCustom];
        mb.frame = CGRectMake(0, 0, 100, 50);
        mb.backgroundColor = [UIColor yellowColor];
        [mb addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
        [self.calloutview addSubview:mb];
	}
	return self;
}

- (void)clickMe:(id)sender {
	NSLog(@"hello, i am in annotation view.");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        [self addSubview:self.calloutview];
    } else {
        [self.calloutview removeFromSuperview];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView != nil) {
        [self.superview bringSubviewToFront:self];
    }
    return hitView;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = self.bounds;
    BOOL isInside = CGRectContainsPoint(rect, point);
    if(!isInside)
    {
        for (UIView *view in self.subviews)
        {
            isInside = CGRectContainsPoint(view.frame, point);
            if(isInside)
                break;
        }
    }
    return isInside;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	CGFloat stroke = 1.0;
    CGFloat radius = 7.0;
    CGMutablePathRef path = CGPathCreateMutable();
    UIColor *color;
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat parentX = 10;
        //Determine Size
    rect = self.bounds;
    rect.size.width = 50;
    rect.size.height = 50;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
        //Create Path For Callout Bubble
    CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y + radius);
    CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.origin.y + rect.size.height - radius);
    CGPathAddArc(path, NULL, rect.origin.x + radius, rect.origin.y + rect.size.height - radius, radius, M_PI, M_PI / 2, 1);
    CGPathAddLineToPoint(path, NULL, parentX - 15, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL, parentX, rect.origin.y + rect.size.height + 15);
    CGPathAddLineToPoint(path, NULL, parentX + 15, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + rect.size.height);
    CGPathAddArc(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + rect.size.height - radius, radius, M_PI / 2, 0.0f, 1);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + rect.size.width, rect.origin.y + radius);
    CGPathAddArc(path, NULL, rect.origin.x + rect.size.width - radius, rect.origin.y + radius, radius, 0.0f, -M_PI / 2, 1);
    CGPathAddLineToPoint(path, NULL, rect.origin.x + radius, rect.origin.y);
    CGPathAddArc(path, NULL, rect.origin.x + radius, rect.origin.y + radius, radius, -M_PI / 2, M_PI, 1);
    CGPathCloseSubpath(path);
    
        //Fill Callout Bubble & Add Shadow
    color = [[UIColor blackColor] colorWithAlphaComponent:.6];
    [color setFill];
    CGContextAddPath(context, path);
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, CGSizeMake (0, 5), 6, [UIColor colorWithWhite:0 alpha:.5].CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
        //Stroke Callout Bubble
    color = [[UIColor darkGrayColor] colorWithAlphaComponent:.9];
    [color setStroke];
    CGContextSetLineWidth(context, stroke);
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
        //Determine Size for Gloss
    CGRect glossRect = self.bounds;
    glossRect.size.width = rect.size.width - stroke;
    glossRect.size.height = (rect.size.height - stroke) / 2;
    glossRect.origin.x = rect.origin.x + stroke / 2;
    glossRect.origin.y += rect.origin.y + stroke / 2;
    
    CGFloat glossTopRadius = radius - stroke / 2;
    CGFloat glossBottomRadius = radius / 1.5;
    
        //Create Path For Gloss
	CGMutablePathRef glossPath = CGPathCreateMutable();
	CGPathMoveToPoint(glossPath, NULL, glossRect.origin.x, glossRect.origin.y + glossTopRadius);
	CGPathAddLineToPoint(glossPath, NULL, glossRect.origin.x, glossRect.origin.y + glossRect.size.height - glossBottomRadius);
	CGPathAddArc(glossPath, NULL, glossRect.origin.x + glossBottomRadius, glossRect.origin.y + glossRect.size.height - glossBottomRadius, glossBottomRadius, M_PI, M_PI / 2, 1);
	CGPathAddLineToPoint(glossPath, NULL, glossRect.origin.x + glossRect.size.width - glossBottomRadius, glossRect.origin.y + glossRect.size.height);
	CGPathAddArc(glossPath, NULL, glossRect.origin.x + glossRect.size.width - glossBottomRadius, glossRect.origin.y + glossRect.size.height - glossBottomRadius, glossBottomRadius, M_PI / 2, 0.0f, 1);
	CGPathAddLineToPoint(glossPath, NULL, glossRect.origin.x + glossRect.size.width, glossRect.origin.y + glossTopRadius);
	CGPathAddArc(glossPath, NULL, glossRect.origin.x + glossRect.size.width - glossTopRadius, glossRect.origin.y + glossTopRadius, glossTopRadius, 0.0f, -M_PI / 2, 1);
	CGPathAddLineToPoint(glossPath, NULL, glossRect.origin.x + glossTopRadius, glossRect.origin.y);
	CGPathAddArc(glossPath, NULL, glossRect.origin.x + glossTopRadius, glossRect.origin.y + glossTopRadius, glossTopRadius, -M_PI / 2, M_PI, 1);
	CGPathCloseSubpath(glossPath);
    
        //Fill Gloss Path
    CGContextAddPath(context, glossPath);
    CGContextClip(context);
    CGFloat colors[] =
    {
	1, 1, 1, .3,
	1, 1, 1, .1,
    };
    CGFloat locations[] = { 0, 1.0 };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, colors, locations, 2);
    CGPoint startPoint = glossRect.origin;
    CGPoint endPoint = CGPointMake(glossRect.origin.x, glossRect.origin.y + glossRect.size.height);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    
        //Gradient Stroke Gloss Path
    CGContextAddPath(context, glossPath);
    CGContextSetLineWidth(context, 2);
    CGContextReplacePathWithStrokedPath(context);
    CGContextClip(context);
    CGFloat colors2[] =
    {
	1, 1, 1, .3,
	1, 1, 1, .1,
	1, 1, 1, .0,
    };
    CGFloat locations2[] = { 0, .1, 1.0 };
    CGGradientRef gradient2 = CGGradientCreateWithColorComponents(space, colors2, locations2, 3);
    CGPoint startPoint2 = glossRect.origin;
    CGPoint endPoint2 = CGPointMake(glossRect.origin.x, glossRect.origin.y + glossRect.size.height);
    CGContextDrawLinearGradient(context, gradient2, startPoint2, endPoint2, 0);
    
        //Cleanup
    CGPathRelease(path);
    CGPathRelease(glossPath);
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
    CGGradientRelease(gradient2);
}
*/

@end
