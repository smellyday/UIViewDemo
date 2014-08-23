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
    CGPoint RealContentViewInitalCenterPos;
	CGPoint RealContentViewExpandedCenterPos;
    CGPoint _gestureBeginPos;
}

@end

#define MENU_BTN_W 80
#define DIS 15


@implementation WYTripCell
@synthesize daythLabel = _daythLabel;
@synthesize dateLabel = _dateLabel;
@synthesize weekLabel = _weekLabel;
@synthesize citiesNameLabel = _citiesNameLabel;

@synthesize realContentView = _realContentView;
@synthesize cellSt = _cellSt;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _realContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _realContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
        _realContentView.backgroundColor = [UIColor yellowColor];
        
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
		
		/*BUG: if selectionStyle is not "None", clicking cell could show selectedBackgroundView which could result in bug.*/
		self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-MENU_BTN_W*2, 0, MENU_BTN_W*2, 100)];
//        blueView.backgroundColor = [UIColor redColor];
//        [self insertSubview:blueView atIndex:0];
		
		UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		delBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W, 0, MENU_BTN_W, 100);
		delBtn.backgroundColor = [UIColor redColor];
		[delBtn addTarget:self action:@selector(onClickDelButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:delBtn atIndex:0];
		
		UIButton *helBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		helBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W*2, 0, MENU_BTN_W, 100);
		helBtn.backgroundColor = [UIColor brownColor];
		[helBtn addTarget:self action:@selector(onClickHelButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:helBtn atIndex:0];
		
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGestureRecognizer.delegate = self;
        [_realContentView addGestureRecognizer:panGestureRecognizer];
        
        _cellSt = tripCellStatusNormal;
        
    }
    return self;
}

- (void)onClickDelButton:(id)sender {
	mlog(@"^^^Click DDDel Button");
}

- (void)onClickHelButton:(id)sender {
	mlog(@"^^^Click HHHel Button");
}

- (void)layoutSubviews {
	
	RealContentViewInitalCenterPos = _realContentView.center;
	CGFloat x = RealContentViewInitalCenterPos.x - MENU_BTN_W*2;
	CGFloat y = RealContentViewInitalCenterPos.y;
	RealContentViewExpandedCenterPos = CGPointMake(x, y);
	
}

- (void)setCellSt:(TripCellStatus)st {
	
	switch (st) {
		case tripCellStatusNormal: {
			
			NSTimeInterval dur = (RealContentViewInitalCenterPos.x-_realContentView.center.x)/500;
			dur = MIN(dur, 0.15);
			
			[UIView animateWithDuration:dur animations:^{
				_realContentView.center = RealContentViewInitalCenterPos;
			}];
			_gestureBeginPos = CGPointZero;
		}
			break;
			
		case tripCellStatusExpanded: {
			
			NSTimeInterval dur = (_realContentView.center.x-RealContentViewExpandedCenterPos.x)/500;
			dur = MIN(dur, 0.15);
			
			[UIView animateWithDuration:dur animations:^{
				_realContentView.center = RealContentViewExpandedCenterPos;
			}];
			_gestureBeginPos = CGPointZero;
		}
			
			break;
			
		default:
			break;
	}
	
	if (st != _cellSt) {
		_cellSt = st;
		[_delegate cellStateChanged:self];
	}
	
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (![panGesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        return;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        _gestureBeginPos = [panGesture locationInView:self];
        mlog(@"== PanGesture == state : Begin, PosX : %f, PosY : %f", _gestureBeginPos.x, _gestureBeginPos.y);
        
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        mlog(@"== PanGesture == state : Chang, PosX : %f, PosY : %f", [panGesture locationInView:self].x, [panGesture locationInView:self].y);
		
        CGPoint movePos = [panGesture locationInView:self];
        CGFloat deltaX = movePos.x - _gestureBeginPos.x;
		CGFloat ncx = 0;
		if (_cellSt == tripCellStatusNormal) {
			ncx = RealContentViewInitalCenterPos.x + deltaX;
		} else if (_cellSt == tripCellStatusExpanded) {
			ncx = RealContentViewExpandedCenterPos.x + deltaX;
		} else {
			NSAssert(0, @"NO other TripCellStatus, so never come here");
		}
		ncx = MAX(ncx, RealContentViewExpandedCenterPos.x);
		ncx = MIN(ncx, RealContentViewInitalCenterPos.x);
		
		_realContentView.center = CGPointMake(ncx, RealContentViewInitalCenterPos.y);
		
        
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        mlog(@"== PanGesture == state : Ended");
		
		CGPoint endPos = [panGesture locationInView:self];
		CGFloat delta = 0;
		if (_cellSt == tripCellStatusNormal) {
			
			delta = _gestureBeginPos.x - endPos.x;
			if (delta >= DIS) {
				self.cellSt = tripCellStatusExpanded;
			} else {
				self.cellSt = tripCellStatusNormal;
			}
			
		} else if (_cellSt == tripCellStatusExpanded) {
			
			delta = endPos.x - _gestureBeginPos.x;
			if (delta >= DIS) {
				self.cellSt = tripCellStatusNormal;
			} else {
				self.cellSt = tripCellStatusExpanded;
			}

		} else {
			NSAssert(0, @"NO other TripCellStatus, so never come here");
		}
		
		
    }
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    mlog(@"%s", __func__);
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint velocityPoint = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.contentView];
        CGFloat ratio = fabs(velocityPoint.y) / fabs(velocityPoint.x);

		return ratio > 1 ? NO : YES;
        
    }
    
    return NO;
}








- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
