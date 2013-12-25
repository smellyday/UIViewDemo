//
//  WYPickerView.h
//  WeiYou
//
//  Created by owen on 12/12/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
	WYPickerDate         = 1 >> 0,
	WYPickerCountOfDay   = 1 >> 1
} WYPickerType;


@class WYPickerView;
@protocol WYPickerViewDelegate <NSObject>
@optional
- (void)clickOKButtonWithPickerView:(WYPickerView *)pView withString:(NSString *)info;
- (void)clickCancelButtonWithPickerView:(WYPickerView *)pView;
@end


@interface WYPickerView : UIView <UIPickerViewDataSource, UIPickerViewDelegate> {
	WYPickerType _pickerType;
	
	UIButton *_okButton;
	UIButton *_cancelButton;
	
	UIPickerView *_countOfDaysPicker;
	NSString *_daysCountString;
	UIDatePicker *_datePicker;
}

@property (nonatomic) WYPickerType pickerType;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIPickerView *countOfDaysPicker;
@property (nonatomic, strong) NSString *daysCountString;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic) id<WYPickerViewDelegate> delegate;

- (id)initWithPickerType:(WYPickerType)type;

@end
