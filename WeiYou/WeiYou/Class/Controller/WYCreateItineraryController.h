//
//  WYCreateItineraryController.h
//  WeiYou
//
//  Created by zhangpan on 14/11/11.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYCreateItineraryController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate> {
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
