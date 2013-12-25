//
//  WYTableFooterView.m
//  WeiYou
//
//  Created by owen on 12/10/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTableFooterView.h"
#import "consts.h"

@implementation WYTableFooterView
@synthesize activityIndicator = _activityIndicator;
@synthesize infoLabel = _infoLabel;
@synthesize refreshArraw = _refreshArraw;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		
		self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, REFRESH_HEADER_HEIGHT)];
		_infoLabel.backgroundColor = [UIColor clearColor];
		_infoLabel.font = [UIFont boldSystemFontOfSize:12.0];
		_infoLabel.textAlignment = NSTextAlignmentCenter;
		[self addSubview:_infoLabel];
		
		self.refreshArraw = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]];
		_refreshArraw.frame = CGRectMake(floorf((REFRESH_HEADER_HEIGHT - 27) / 2),
										(floorf(REFRESH_HEADER_HEIGHT - 44) / 2),
										27, 44);
		[self addSubview:_refreshArraw];
		
		self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		_activityIndicator.frame = CGRectMake(floorf(floorf(REFRESH_HEADER_HEIGHT - 20) / 2), floorf((REFRESH_HEADER_HEIGHT - 20) / 2), 20, 20);
		_activityIndicator.hidesWhenStopped = YES;
		[self addSubview:_activityIndicator];
		
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
