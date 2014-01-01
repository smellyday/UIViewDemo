//
//  WYPickerView.m
//  WeiYou
//
//  Created by owen on 12/12/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYPickerView.h"
#import "consts.h"

@interface WYPickerView (private)

- (void)pickTime:(id)sender;

@end

@implementation WYPickerView
@synthesize pickerType = _pickerType;
@synthesize okButton = _okButton;
@synthesize cancelButton = _cancelButton;
@synthesize datePicker = _datePicker;
@synthesize countOfDaysPicker = _countOfDaysPicker;
@synthesize daysCountString = _daysCountString;
@synthesize delegate;


- (id)initWithPickerType:(WYPickerType)type {
	self = [super init];
	if (self) {
		self.backgroundColor = [UIColor whiteColor];
		self.pickerType = type;
		self.daysCountString = @"1";
		
			//init header
		UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
		header.backgroundColor = [UIColor blackColor];
		self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
		self.okButton.frame = CGRectMake(320-74.7, 2, 64.7, 40);
		[self.okButton setTitle:@"OK" forState:UIControlStateNormal];
		[self.okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[self.okButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
		[self.okButton addTarget:self action:@selector(clickOKButton:) forControlEvents:UIControlEventTouchUpInside];
		[header addSubview:_okButton];
		self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
		self.cancelButton.frame = CGRectMake(10, 2, 64.7, 40);
		[self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
		[self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[self.cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
		[self.cancelButton addTarget:self action:@selector(clickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
		[header addSubview:_cancelButton];
		[self addSubview:header];
		
		if (type == WYPickerDate) {
			
				//init date picker.
			self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
			self.datePicker.calendar = [NSCalendar currentCalendar];
			self.datePicker.date = [NSDate dateWithTimeIntervalSinceNow:0];
			self.datePicker.datePickerMode = UIDatePickerModeDate;
			[self.datePicker addTarget:self action:@selector(pickTime:) forControlEvents:UIControlEventValueChanged];
			[self addSubview:_datePicker];
			
		} else if (type == WYPickerCountOfDay) {
			
				//init date picker.
			self.countOfDaysPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, 320, 216)];
			self.countOfDaysPicker.delegate = self;
			self.countOfDaysPicker.dataSource = self;
			self.countOfDaysPicker.showsSelectionIndicator = YES;
			[self addSubview:_countOfDaysPicker];
		}
	}
	return self;
}

- (void)clickOKButton:(id)sender {
	if (_pickerType == WYPickerCountOfDay) {
		[delegate clickOKButtonWithPickerView:self withString:_daysCountString];
	} else if (_pickerType == WYPickerDate) {
		NSDate *date = [self.datePicker date];
		NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
		[dateFormater setDateStyle:NSDateFormatterLongStyle];
		[delegate clickOKButtonWithPickerView:self withString:[dateFormater stringFromDate:date]];
	}
}

- (void)clickCancelButton:(id)sender {
	[delegate clickCancelButtonWithPickerView:self];
}

- (void)pickTime:(id)sender {
	
}

#pragma UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 100;
}

#pragma UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	
	long count = row+1;
	NSString *countStr = [NSString stringWithFormat:@"%ld", count];
	return countStr;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	self.daysCountString = [NSString stringWithFormat:@"%ld", (long)(row+1)];
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
