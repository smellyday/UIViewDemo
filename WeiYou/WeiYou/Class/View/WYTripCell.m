//
//  WYTripCell.m
//  WeiYou
//
//  Created by owen on 12/17/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	// cell height is 80

#import "WYTripCell.h"
#import "WYDataEngine.h"
#import "consts.h"


@interface WYTripCell () {
    CGPoint RealContentViewInitalCenterPos;
	CGPoint RealContentViewExpandedCenterPos;
	CGPoint _referenceCenterPos;
    CGPoint _gestureBeginPos;
	
	UIPanGestureRecognizer *_panGR;
}

@end

#define MENU_BTN_W 80
#define DIS 15


@implementation WYTripCell
@synthesize daythLabel = _daythLabel;
@synthesize dateLabel = _dateLabel;
@synthesize weekLabel = _weekLabel;
@synthesize citiesNameLabel = _citiesNameLabel;

@synthesize indexPath = _indexPath;
@synthesize realContentView = _realContentView;
@synthesize cellSt = _cellSt;
@synthesize delegate = _delegate;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _realContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _realContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
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
		
		UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		delBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W, 0, MENU_BTN_W, 100);
		delBtn.backgroundColor = [UIColor redColor];
		[delBtn addTarget:self action:@selector(onClickDelButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:delBtn atIndex:0];
		
		UIButton *helBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		helBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W*2, 0, MENU_BTN_W, 100);
		helBtn.backgroundColor = [UIColor brownColor];
		[helBtn addTarget:self action:@selector(onClickEditButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:helBtn atIndex:0];
		
        
        _panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
		_panGR.maximumNumberOfTouches = 1;
		_panGR.minimumNumberOfTouches = 1;
        _panGR.delegate = self;
        [_realContentView addGestureRecognizer:_panGR];
        
        _cellSt = tripCellStateNormal;
        
    }
    return self;
}

- (void)onClickDelButton:(id)sender {
	mlog(@"^^^Click Del Button");
	if (_cellSt == tripCellStateExpanded) {
		[_delegate deleteCell:self];
	}
}

- (void)onClickEditButton:(id)sender {
	mlog(@"^^^Click Edit Button");
	if (_cellSt == tripCellStateExpanded) {
		self.cellSt = tripCellStateNormal;
	}
}

- (void)layoutSubviews {
	
	RealContentViewInitalCenterPos = _realContentView.center;
	CGFloat x = RealContentViewInitalCenterPos.x - MENU_BTN_W*2;
	CGFloat y = RealContentViewInitalCenterPos.y;
	RealContentViewExpandedCenterPos = CGPointMake(x, y);
	_referenceCenterPos = RealContentViewInitalCenterPos;
	
}

- (void)setCellSt:(TripCellStatus)st {
	
	switch (st) {
		case tripCellStateNormal: {
			
			NSTimeInterval dur = (RealContentViewInitalCenterPos.x-_realContentView.center.x)/500;
			dur = MIN(dur, 0.15);
			
			[UIView animateWithDuration:dur animations:^{
				_realContentView.center = RealContentViewInitalCenterPos;
			}];
			_gestureBeginPos = CGPointZero;
			_referenceCenterPos = RealContentViewInitalCenterPos;
		}
			break;
			
		case tripCellStateExpanding:
			break;
			
		case tripCellStateExpanded: {
			
			NSTimeInterval dur = (_realContentView.center.x-RealContentViewExpandedCenterPos.x)/500;
			dur = MIN(dur, 0.15);
			
			[UIView animateWithDuration:dur animations:^{
				_realContentView.center = RealContentViewExpandedCenterPos;
			}];
			_gestureBeginPos = CGPointZero;
			_referenceCenterPos = RealContentViewExpandedCenterPos;
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


- (void)backToNormalState {
	_cellSt = tripCellStateNormal;
	
	NSTimeInterval dur = (RealContentViewInitalCenterPos.x-_realContentView.center.x)/500;
	dur = MIN(dur, 0.15);
	
	[UIView animateWithDuration:dur animations:^{
		_realContentView.center = RealContentViewInitalCenterPos;
	}];
	
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (![panGesture isKindOfClass:[UIPanGestureRecognizer class]] || panGesture != _panGR) {
        return;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        mlog(@"== PanGesture == state : Begin");
		
		
        _gestureBeginPos = [panGesture locationInView:self];
		
		if (_referenceCenterPos.x == 0) {
			if (_cellSt == tripCellStateNormal) {
				_referenceCenterPos = RealContentViewInitalCenterPos;
			} else if (_cellSt == tripCellStateExpanded) {
				_referenceCenterPos = RealContentViewExpandedCenterPos;
			} else {
				_cellSt = tripCellStateNormal;
				_referenceCenterPos = RealContentViewInitalCenterPos;
			}
		}
		
		self.cellSt = tripCellStateExpanding;
        
    } else if (panGesture.state == UIGestureRecognizerStateChanged) {
        mlog(@"== PanGesture == state : Chang");
		
        CGPoint movePos = [panGesture locationInView:self];
        CGFloat deltaX = movePos.x - _gestureBeginPos.x;
		CGFloat ncx = _referenceCenterPos.x + deltaX;
		
		ncx = MAX(ncx, RealContentViewExpandedCenterPos.x);
		ncx = MIN(ncx, RealContentViewInitalCenterPos.x);
		
		_realContentView.center = CGPointMake(ncx, RealContentViewInitalCenterPos.y);
		
        
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        mlog(@"== PanGesture == state : Ended");
		
		CGPoint endPos = [panGesture locationInView:self];
		CGFloat delta = 0;
		if (_referenceCenterPos.x == RealContentViewInitalCenterPos.x) {
			
			delta = _gestureBeginPos.x - endPos.x;
			if (delta >= DIS) {
				self.cellSt = tripCellStateExpanded;
			} else {
				self.cellSt = tripCellStateNormal;
			}
			
		} else if (_referenceCenterPos.x == RealContentViewExpandedCenterPos.x) {
			
			delta = endPos.x - _gestureBeginPos.x;
			if (delta >= DIS) {
				self.cellSt = tripCellStateNormal;
			} else {
				self.cellSt = tripCellStateExpanded;
			}

		} else {
			NSAssert(0, @"NO other TripCellStatus, so never come here");
		}
		
    } else if (panGesture.state == UIGestureRecognizerStateCancelled) {
        mlog(@"== PanGesture == state : Cancelled");
		
		self.cellSt = tripCellStateNormal;
		
	} else if (panGesture.state == UIGestureRecognizerStateFailed) {
        mlog(@"== PanGesture == state : Failed");
		
		self.cellSt = tripCellStateNormal;
		
	}
}


#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	if ([_delegate getTableViewState] == tripCellStateNormal) {
		return YES;
	}
	
	return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    mlog(@"%s", __func__);
	
    if (gestureRecognizer == _panGR) {
        CGPoint velocityPoint = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.contentView];
        CGFloat ratio = fabs(velocityPoint.y) / fabs(velocityPoint.x);

		return ratio > 1 ? NO : YES;
    }
    
    return NO;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([_delegate getTableViewState] == tripCellStateNormal) {
		[super touchesBegan:touches withEvent:event];
		return;
	}
	
	if (_cellSt == tripCellStateExpanded) {
		CGPoint p = [[touches anyObject] locationInView:self];
		if (p.x > (SCREEN_WIDTH-MENU_BTN_W*2)) {
			[super touchesBegan:touches withEvent:event];
			return;
		}
	}
	
	[_delegate recoverTableViewToNormal];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
