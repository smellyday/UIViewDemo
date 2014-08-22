//
//  WYTripCell.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	// cell height is 80

#import "WYTripCell.h"
#import "consts.h"


@interface WYTripCell () {
    CGPoint _realContentViewInitalCenterPos;
    CGPoint _gestureBeginPos;
}

@end



@implementation WYTripCell
@synthesize daythLabel = _daythLabel;
@synthesize dateLabel = _dateLabel;
@synthesize weekLabel = _weekLabel;
@synthesize citiesNameLabel = _citiesNameLabel;

@synthesize realContentView = _realContentView;
@synthesize cellSt = _cellSt;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _realContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _realContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
        _realContentView.backgroundColor = [UIColor yellowColor];
        _realContentViewInitalCenterPos = _realContentView.center;
        
		self.daythLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 80)];
		self.daythLabel.font = [UIFont systemFontOfSize:18];
        self.daythLabel.textAlignment = NSTextAlignmentCenter;
        [_realContentView addSubview:_daythLabel];
		self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(80+80, 60, 100, 20)];
		self.dateLabel.font = [UIFont systemFontOfSize:10];
        [_realContentView addSubview:_dateLabel];
		self.weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(180+80, 60, 100, 20)];
		self.weekLabel.font = [UIFont systemFontOfSize:10];
		[_realContentView addSubview:_weekLabel];
		
		self.citiesNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 200, 40)];
		self.citiesNameLabel.font = [UIFont boldSystemFontOfSize:20];
        self.citiesNameLabel.textAlignment = NSTextAlignmentLeft;
		[_realContentView addSubview:_citiesNameLabel];
        
        [self addSubview:_realContentView];
        
        UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(240, 0, 80, 100)];
        blueView.backgroundColor = [UIColor blueColor];
        [self insertSubview:blueView atIndex:0];
        
        
//		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGestureRecognizer.delegate = self;
        [_realContentView addGestureRecognizer:panGestureRecognizer];
        
        self.cellSt = tripCellStatusNormal;
        
    }
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (![panGesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        return;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        _gestureBeginPos = [panGesture locationInView:self];
        mlog(@"== PanGesture == state : Begin, PosX : %f, PosY : %f", _gestureBeginPos.x, _gestureBeginPos.y);
        
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint movePos = [panGesture locationInView:self];
        mlog(@"== PanGesture == state : Chang, PosX : %f, PosY : %f", movePos.x, movePos.y);
        CGFloat deltaX = movePos.x - _gestureBeginPos.x;
        if (deltaX < 0 && deltaX > -200) {
            CGFloat ncx = self.center.x + deltaX;
            CGFloat ncy = _realContentView.center.y;
            _realContentView.center = CGPointMake(ncx, ncy);
        }
        
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        mlog(@"== PanGesture == state : Ended");
        _gestureBeginPos = CGPointZero;
    }
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    mlog(@"%s", __func__);
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint velocityPoint = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.contentView];
        CGFloat ratio = fabs(velocityPoint.y) / fabs(velocityPoint.x);
        
        if (ratio > 1) {
            _realContentView.center = _realContentViewInitalCenterPos;
            return NO;
        } else {
            [self setSelected:NO];
            return YES;
        }
        
    }
    
    return NO;
}


- (void)recover {
    
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];

}

@end
