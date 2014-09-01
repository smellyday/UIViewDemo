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

@interface SeperateLine : UIView

@end

@implementation SeperateLine

-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 1);
    
    CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0, 1);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context,[UIColor lightGrayColor].CGColor);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context,0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
    
    
}

@end


@interface WYTripCell () {
    CGPoint RealContentViewInitalCenterPos;
	CGPoint RealContentViewExpandedCenterPos;
	CGPoint _referenceCenterPos;
    CGPoint _gestureBeginPos;
    
    SeperateLine *_sepLine;
	
	UIPanGestureRecognizer *_panGR;
}

@property (nonatomic, strong) SeperateLine *sepLine;

@end

#define MENU_BTN_W 68
#define DIS 15


@implementation WYTripCell

@synthesize mainImageView = _mainImageView;
@synthesize mainTitleLabel = _mainTitleLabel;
@synthesize citiesDesLabel = _citiesDesLabel;
@synthesize departureDateLabel = _departureDateLabel;
@synthesize daysNumberLabel = _daysNumberLabel;
@synthesize sepLine = _sepLine;

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
        _realContentView.backgroundColor = [UIColor whiteColor];
		_realContentView.alpha = 1.0;
        
        // ======
        self.mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 7, 105, 73)];
        self.mainImageView.image = [UIImage imageNamed:@"tmp.png"];
        [_realContentView addSubview:_mainImageView];
        
        self.mainTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(121, 8, 190, 28)];
		self.mainTitleLabel.font = [UIFont systemFontOfSize:16];
        self.mainTitleLabel.textAlignment = NSTextAlignmentLeft;
        [_realContentView addSubview:_mainTitleLabel];
        
        self.citiesDesLabel = [[UILabel alloc] initWithFrame:CGRectMake(121, 36, 190, 26)];
		self.citiesDesLabel.font = [UIFont systemFontOfSize:11];
        self.citiesDesLabel.textAlignment = NSTextAlignmentLeft;
        self.citiesDesLabel.text = @"伦敦、巴黎、柏林、罗马";
        [_realContentView addSubview:_citiesDesLabel];
        
        self.departureDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(121, 62, 60, 20)];
        self.departureDateLabel.font = [UIFont systemFontOfSize:9];
        self.departureDateLabel.textAlignment = NSTextAlignmentLeft;
        self.departureDateLabel.text = @"2014.08.20";
        [_realContentView addSubview:_departureDateLabel];
        
        self.daysNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(181, 62, 30, 20)];
        self.daysNumberLabel.font = [UIFont systemFontOfSize:9];
        self.daysNumberLabel.textAlignment = NSTextAlignmentLeft;
        self.daysNumberLabel.text = @"15天";
        [_realContentView addSubview:_daysNumberLabel];

        self.sepLine = [[SeperateLine alloc] initWithFrame:CGRectMake(10, 86, SCREEN_WIDTH-20, 1)];
        _sepLine.backgroundColor = [UIColor clearColor];
        [_realContentView addSubview:_sepLine];
        
        [self addSubview:_realContentView];
		
		/*BUG: if selectionStyle is not "None", clicking cell could show selectedBackgroundView which could result in bug.*/
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIButton *editBtn = [[UIButton alloc] init];
		editBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W, 0, MENU_BTN_W, 86);
		editBtn.backgroundColor = RGBCOLOR(126, 165, 179);
        editBtn.imageEdgeInsets = UIEdgeInsetsMake(13, 12, 29, 12);
        [editBtn setImage:IMG(PIC_ICON_CELL_EDIT) forState:UIControlStateNormal];
        editBtn.titleEdgeInsets = UIEdgeInsetsMake(57, 0, 13, 0);
        [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        editBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        editBtn.titleLabel.backgroundColor = [UIColor redColor];
        editBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        editBtn.titleLabel.frame = CGRectMake(0, 57, 68, 16);
		[editBtn addTarget:self action:@selector(onClickEditButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:editBtn atIndex:0];
		
		UIButton *delBtn = [[UIButton alloc] init];
		delBtn.frame = CGRectMake(SCREEN_WIDTH-MENU_BTN_W*2, 0, MENU_BTN_W, 86);
		delBtn.backgroundColor = RGBCOLOR(232, 98, 92);
        delBtn.imageEdgeInsets = UIEdgeInsetsMake(13, 12, 29, 12);
        [delBtn setImage:IMG(PIC_ICON_CELL_DELETE) forState:UIControlStateNormal];
        delBtn.titleEdgeInsets = UIEdgeInsetsMake(57, 0, 13, 0);
        [delBtn setTitle:@"删除" forState:UIControlStateNormal];
		[delBtn addTarget:self action:@selector(onClickDelButton:) forControlEvents:UIControlEventTouchUpInside];
		[self insertSubview:delBtn atIndex:0];
        
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
	MLOGFUNCTION;
	if (_cellSt == tripCellStateExpanded) {
		[_delegate deleteTripCell:self];
	}
}

- (void)onClickEditButton:(id)sender {
	MLOGFUNCTION;
	if (_cellSt == tripCellStateExpanded) {
		[_delegate editTripCell:self];
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
    
    _gestureBeginPos = CGPointZero;
    _referenceCenterPos = RealContentViewInitalCenterPos;
	
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
