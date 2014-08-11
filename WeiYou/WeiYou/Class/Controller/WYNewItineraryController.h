//
//  WYNewItineraryController.h
//  WeiYou
//
//  Created by zhangpan on 14-8-7.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewItineraryController : UIViewController {
	UITextField *_tripNameField;
	UITextField *_daysCountField;
	UITextField *_sDateField;
}

@property (nonatomic, strong) UITextField *tripNameField;
@property (nonatomic, strong) UITextField *daysCountField;
@property (nonatomic, strong) UITextField *sDateField;

@end
