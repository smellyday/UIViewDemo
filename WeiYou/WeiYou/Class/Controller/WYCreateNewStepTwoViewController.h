//
//  WYCreateNewStepTwoViewController.h
//  WeiYou
//
//  Created by owen on 12/12/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYPickerView.h"

@interface WYCreateNewStepTwoViewController : UIViewController <UITextFieldDelegate, WYPickerViewDelegate> {
	NSArray *_cityArray;
	
	UITextField *_dateField;
	UITextField *_countOfDaysField;
	UITextField *_tripNameField;
	
	WYPickerView *_datePicker;
	WYPickerView *_countOfDaysPicker;
}

@property (nonatomic, strong) NSArray *cityArray;

@property (nonatomic, strong) UITextField *dateField;
@property (nonatomic, strong) UITextField *countOfDaysField;
@property (nonatomic, strong) UITextField *tripNameField;

@property (nonatomic, strong) WYPickerView *datePicker;
@property (nonatomic, strong) WYPickerView *countOfDaysPicker;

- (id)initWithCityInfo:(NSArray *)cityArr;

@end
