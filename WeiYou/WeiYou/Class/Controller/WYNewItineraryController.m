//
//  WYNewItineraryController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-7.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYNewItineraryController.h"
#import "consts.h"

@interface WYNewItineraryController ()

@end

@implementation WYNewItineraryController
@synthesize tripNameField = _tripNameField;
@synthesize daysCountField = _daysCountField;
@synthesize sDateField = _sDateField;
@synthesize datePickerView = _datePickerView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = NSLocalizedString(@"create new trip", @"create new trip");
	
	UIBarButtonItem *mCancelBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_BACK_N]
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(onClickCancel:)];
	mCancelBtn.tintColor = [UIColor whiteColor];
	self.navigationItem.leftBarButtonItem = mCancelBtn;
	
	UIBarButtonItem *mOKBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_OK_N]
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(onClickOK:)];
	mOKBtn.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem = mOKBtn;
	
	// main content.
	CGFloat gap1 = 30.0;
	CGFloat fw = 280.0;
	CGFloat fh = 50.0;
	CGFloat leftx = 20.0;
	self.tripNameField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1, fw, fh)];
	_tripNameField.placeholder = NSLocalizedString(@"trip name", @"trip name");
	_tripNameField.autocorrectionType = UITextAutocorrectionTypeNo;
	_tripNameField.returnKeyType = UIReturnKeyDone;
	_tripNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
//	_tripNameField.delegate = self;
//	UIImage *img = [UIImage imageNamed:@"add_new_trip_btn.png"];
//	UIEdgeInsets edge = UIEdgeInsetsMake(10, 20, 10, 20);
//	[img resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeTile];
//	[_tripNameField setBackground:img];
//	[_tripNameField setNeedsDisplay];
	[self.view addSubview:_tripNameField];
	
	self.sDateField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1+fh, fw, fh)];
	_sDateField.placeholder = NSLocalizedString(@"trip begin date", @"trip begin date");
	_sDateField.autocorrectionType = UITextAutocorrectionTypeNo;
	_sDateField.returnKeyType = UIReturnKeyDone;
	_sDateField.clearButtonMode = UITextFieldViewModeWhileEditing;
	[self.view addSubview:_sDateField];
	
	self.daysCountField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1+fh*2, fw, fh)];
	_daysCountField.placeholder = NSLocalizedString(@"trip days count", @"trip days count");
	_daysCountField.autocorrectionType = UITextAutocorrectionTypeNo;
	_daysCountField.returnKeyType = UIReturnKeyDone;
	_daysCountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _daysCountField.keyboardType = UIKeyboardTypeNumberPad;
	[self.view addSubview:_daysCountField];
    
    CGFloat bh = 40.0;
    CGFloat bw = 60.0;
    UIButton *okbtn = [[UIButton alloc] init];
    okbtn.frame = CGRectMake(SCREEN_WIDTH-bw, 0, bw, bh);
    [okbtn setTitle:NSLocalizedString(@"ok", @"ok") forState:UIControlStateNormal];
    [okbtn setTitleColor:CHAR_COLOR_ON_BTN forState:UIControlStateNormal];
    [okbtn addTarget:self action:@selector(onClickDateOK:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelbtn = [[UIButton alloc] init];
    cancelbtn.frame = CGRectMake(0, 0, bw, bh);
    [cancelbtn setTitle:NSLocalizedString(@"cancel", @"cancel") forState:UIControlStateNormal];
    [cancelbtn setTitleColor:CHAR_COLOR_ON_BTN forState:UIControlStateNormal];
    [cancelbtn addTarget:self action:@selector(onClickDateCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    self.datePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, KEYBOARD_HEIGHT_P)];
    _datePickerView.backgroundColor = [UIColor whiteColor];
    _datePickerView.dataSource = self;
    _datePickerView.delegate = self;
    _datePickerView.showsSelectionIndicator = YES;
    
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KEYBOARD_HEIGHT_P+40)];
    [inputView addSubview:okbtn];
    [inputView addSubview:cancelbtn];
    [inputView addSubview:_datePickerView];
    [_sDateField setInputView:inputView];
    
    UITapGestureRecognizer *tapForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tapForHideKeyboard];
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onClickOK:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onClickDateOK:(id)sender {
    [_sDateField resignFirstResponder];
}

- (void)onClickDateCancel:(id)sender {
    [_sDateField resignFirstResponder];
}

- (void)dismissKeyboard:(id)sender {
    [_sDateField resignFirstResponder];
    [_daysCountField resignFirstResponder];
    [_tripNameField resignFirstResponder];
}

#pragma mark - UIPicker Data Source & Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"hello";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
}


// ==
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
