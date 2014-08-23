//
//  WYTripTableView.m
//  WeiYou
//
//  Created by owen on 8/24/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYTripTableView.h"
#import "consts.h"


@implementation WYTripTableView
@synthesize cellState = _cellState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		isContain = NO;
    }
    return self;
}


- (void)registerTripCell:(WYTripCell *)cell {
	mlog(@"%s : tripName == %@", __func__, cell.citiesNameLabel.text);
	_chsCell = cell;
	_cellState = cell.cellSt;
	if (_cellState == tripCellStatusNormal) {
		self.scrollEnabled = YES;
	} else {
		self.scrollEnabled = NO;
	}
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	if (!_chsCell) {
		return [super hitTest:point withEvent:event];
	}
	
	isContain = [_chsCell pointInside:point withEvent:event];
	if (isContain) {
		mlog(@"++ is contain");
	} else {
		mlog(@"++ is not contain");
	}
	
	if (_cellState == tripCellStatusNormal || isContain) {
		return [super hitTest:point withEvent:event];
	}
	
	return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!_chsCell) {
		return [super touchesBegan:touches withEvent:event];
	}
	
//	BOOL isContain = NO;
//	for (UITouch *touch in touches.allObjects) {
//		CGPoint tPoint = [touch locationInView:_chsCell];
//		if ([_chsCell pointInside:tPoint withEvent:event]) {
//			isContain = YES;
//		}
//	}
	if (_cellState == tripCellStatusNormal || isContain) {
		[super touchesBegan:touches withEvent:event];
	} else {
		[_chsCell setCellSt:tripCellStatusNormal];
	}
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
