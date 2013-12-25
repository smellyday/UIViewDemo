//
//  WYCreateNewStepTwoViewController.m
//  WeiYou
//
//  Created by owen on 12/12/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYCreateNewStepTwoViewController.h"
#import "consts.h"

@interface WYCreateNewStepTwoViewController ()

@end

@implementation WYCreateNewStepTwoViewController
@synthesize cityArray = _cityArray;
@synthesize dateField = _dateField;
@synthesize countOfDaysField = _countOfDaysField;
@synthesize tripNameField = _tripNameField;
@synthesize datePicker = _datePicker;
@synthesize countOfDaysPicker = _countOfDaysPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCityInfo:(NSArray *)cityArr {
	self = [super init];
	if (self) {
		self.cityArray = cityArr;
	}
	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = WY_MAIN_COLOR_BG;
	
	
		//init text field.
	int gap = 10;
	
	UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, gap, 114, 40)];
	dateLabel.textAlignment = NSTextAlignmentRight;
	dateLabel.text = @"出行日期：";
	dateLabel.font = [UIFont boldSystemFontOfSize:20];
	[self.view addSubview:dateLabel];
	
	self.dateField = [[UITextField alloc] initWithFrame:CGRectMake(124, gap, 180, 40)];
	self.dateField.borderStyle = UITextBorderStyleRoundedRect;
	self.dateField.delegate = self;
	[self.view addSubview:_dateField];
	
	UILabel *daysLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, gap+50, 114, 40)];
	daysLabel.textAlignment = NSTextAlignmentRight;
	daysLabel.text = @"出行天数：";
	daysLabel.font = [UIFont boldSystemFontOfSize:20];
	[self.view addSubview:daysLabel];
	
	self.countOfDaysField = [[UITextField alloc] initWithFrame:CGRectMake(124, gap+50, 180, 40)];
	self.countOfDaysField.borderStyle = UITextBorderStyleRoundedRect;
	self.countOfDaysField.delegate = self;
	[self.view addSubview:_countOfDaysField];
	
	UILabel *tripNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, gap+100, 114, 40)];
	tripNameLabel.textAlignment = NSTextAlignmentRight;
	tripNameLabel.text = @"行程名称：";
	tripNameLabel.font = [UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tripNameLabel];
	
	self.tripNameField = [[UITextField alloc] initWithFrame:CGRectMake(124, gap+100, 180, 40)];
	self.tripNameField.borderStyle = UITextBorderStyleRoundedRect;
	self.tripNameField.delegate = self;
	[self.view addSubview:_tripNameField];
	
	
		//init bottom container.
	UIView *bottomContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-64-60, 320, 60)];
	bottomContainerView.backgroundColor = WY_MAIN_COLOR_BG;
	bottomContainerView.opaque = 0.6;
	
	UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
	doneButton.frame = CGRectMake(64*4, 0, 64, 60);
	doneButton.backgroundColor = [UIColor whiteColor];
	[doneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[doneButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
	doneButton.enabled = YES;
	[doneButton addTarget:self action:@selector(stepDone:) forControlEvents:UIControlEventTouchUpInside];
	[doneButton setTitle:@"完成" forState:UIControlStateNormal];
	[bottomContainerView addSubview:doneButton];
	
	UIButton *beforeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	beforeButton.frame = CGRectMake(0, 0, 64, 60);
	beforeButton.backgroundColor = [UIColor whiteColor];
	[beforeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[beforeButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
	beforeButton.enabled = YES;
	[beforeButton addTarget:self action:@selector(stepBefore:) forControlEvents:UIControlEventTouchUpInside];
	[beforeButton setTitle:@"上一步" forState:UIControlStateNormal];
	[bottomContainerView addSubview:beforeButton];
	
	UILabel *stepTwoLebel = [[UILabel alloc] initWithFrame:CGRectMake(64, 0, 64*3, 60)];
	stepTwoLebel.text = @"Step Two!";
	stepTwoLebel.textColor = [UIColor yellowColor];
	stepTwoLebel.textAlignment = NSTextAlignmentCenter;
	stepTwoLebel.font = [UIFont boldSystemFontOfSize:20];
	[bottomContainerView addSubview:stepTwoLebel];
	
	[self.view addSubview:bottomContainerView];
	
	
		//init picker
	self.datePicker = [[WYPickerView alloc] initWithPickerType:WYPickerDate];
	self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
	self.datePicker.delegate = self;
	[self.view addSubview:_datePicker];
	
	self.countOfDaysPicker = [[WYPickerView alloc] initWithPickerType:WYPickerCountOfDay];
	self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
	self.countOfDaysPicker.delegate = self;
	[self.view addSubview:_countOfDaysPicker];
}

- (void)stepDone:(id)sender {
	mlog(@"create done.");
}

- (void)stepBefore:(id)sender {
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(goBackToStepBefore)];
	self.view.alpha = 0;
	[UIView commitAnimations];
	
}

- (void)goBackToStepBefore {
	[self.view removeFromSuperview];
}

#pragma UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	
	if (textField == self.dateField) {
		
		[self.tripNameField resignFirstResponder];
		
		if (self.countOfDaysPicker.frame.origin.y < self.view.frame.size.height) { //the other picker is on show.
			[UIView animateWithDuration:0.2
							 animations:^{
				self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
			}
							 completion:^(BOOL finished){
				[UIView animateWithDuration:0.5 animations:^{
					self.datePicker.frame = CGRectMake(0, self.view.frame.size.height-260, 320, 260);
				} completion:nil];
			}];
			
		} else {
			
			[UIView animateWithDuration:0.2
							 animations:^{
				self.datePicker.frame = CGRectMake(0, self.view.frame.size.height-260, 320, 260);
			}
							 completion:nil];
			
		}
		
		
	} else if (textField == self.countOfDaysField) {
		
		[self.tripNameField resignFirstResponder];
		
		if (self.datePicker.frame.origin.y < self.view.frame.size.height) { //the other picker is on show.
			[UIView animateWithDuration:0.2
							 animations:^{
								 self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
							 }
							 completion:^(BOOL finished){
								 [UIView animateWithDuration:0.5 animations:^{
									 self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height-260, 320, 260);
								 } completion:nil];
							 }];
			
		} else {
			
			[UIView animateWithDuration:0.2
							 animations:^{
								 self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height-260, 320, 260);
							 }
							 completion:nil];
			
		}
		
	} else if (textField == self.tripNameField) {
		
		if (self.datePicker.frame.origin.y < self.view.frame.size.height) { //the other picker is on show.
			[UIView animateWithDuration:0.2
							 animations:^{
								 self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
							 } completion:nil];
		}
		
		if (self.countOfDaysPicker.frame.origin.y < self.view.frame.size.height) { //the other picker is on show.
			[UIView animateWithDuration:0.2
							 animations:^{
								 self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
							 }
							 completion:nil];
		}
		
		[self.tripNameField setReturnKeyType:UIReturnKeyDone];
		[self.tripNameField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
		return YES;
	}
	
	return NO;
}

- (void)textFieldFinished:(id)sender {
	[sender resignFirstResponder];
}

#pragma WYPickerViewDelegate
- (void)clickOKButtonWithPickerView:(WYPickerView *)pView withString:(NSString *)info {
	if (pView.pickerType == WYPickerDate) {
		
		self.dateField.text = info;
		[UIView animateWithDuration:0.2
						 animations:^{
							 self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
						 } completion:nil];
		
	} else if (pView.pickerType == WYPickerCountOfDay) {
		
		self.countOfDaysField.text = info;
		[UIView animateWithDuration:0.2
						 animations:^{
							 self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
						 }
						 completion:nil];
		
	}
}

- (void)clickCancelButtonWithPickerView:(WYPickerView *)pView {
	if (pView.pickerType == WYPickerDate) {
		[UIView animateWithDuration:0.2
						 animations:^{
							 self.datePicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
						 } completion:nil];
	}
	
	if (pView.pickerType == WYPickerCountOfDay) {
		[UIView animateWithDuration:0.2
						 animations:^{
							 self.countOfDaysPicker.frame = CGRectMake(0, self.view.frame.size.height, 320, 260);
						 }
						 completion:nil];
	}
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
