//
//  WYTableFooterView.h
//  WeiYou
//
//  Created by owen on 12/10/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYTableFooterView : UIView {
	UIActivityIndicatorView *_activityIndicator;
	UIImageView *_refreshArraw;
	UILabel *_infoLabel;
}

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UIImageView *refreshArraw;
@property (nonatomic, strong) UILabel *infoLabel;

@end
