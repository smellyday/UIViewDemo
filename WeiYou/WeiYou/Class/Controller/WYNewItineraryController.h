//
//  WYNewItineraryController.h
//  WeiYou
//
//  Created by zhangpan on 14-8-7.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYNewItineraryController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIActionSheetDelegate> {
	UITextField *_tripNameField;
	UITextField *_daysCountField;
	UITextField *_sDateField;
    
    UIPickerView *_datePickerView;
}

@property (nonatomic, strong) UITextField *tripNameField;
@property (nonatomic, strong) UITextField *daysCountField;
@property (nonatomic, strong) UITextField *sDateField;
@property (nonatomic, strong) UIPickerView *datePickerView;

@end
