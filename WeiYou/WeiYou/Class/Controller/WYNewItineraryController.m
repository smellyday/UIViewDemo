//
//  WYNewItineraryController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-7.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYNewItineraryController.h"
#import "WYFunctionUtility.h"
#import "consts.h"
#import "WYCountriesController.h"
#import "WYDataEngine.h"

@interface WYNewItineraryController ()

- (void)initPickerData;

@end

@implementation WYNewItineraryController {
    NSMutableArray *yearsArray;
    NSArray *monthsArray;
    NSMutableArray *daysArray;
    
    NSInteger selectedYearRow;
    NSInteger selectedMonthRow;
    NSInteger selectedDayRow;
}
@synthesize tripNameField = _tripNameField;
@synthesize daysCountField = _daysCountField;
@synthesize sDateField = _sDateField;
@synthesize datePickerView = _datePickerView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = NSLocalizedString(@"create new trip", @"create new trip");
    
    // init wymtrip in DataEngine.
    [[WYDataEngine sharedDataEngine] createNewTrip];
    
    // prepare data for date picker.
    [self initPickerData];
	
    // nav bar.
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
	CGFloat hgap1 = 30.0;
	CGFloat wgap1 = 10.0;
	CGFloat leftx = 20.0;
	CGFloat iconw = 16.0;
	CGFloat iconh = 16.0;
	CGFloat fw = SCREEN_WIDTH-leftx*2-iconw-wgap1;
	CGFloat fh = 45.0;
	CGFloat linew = 295.0;
	CGFloat lineh = 1.0;
	
		// init trip name field.
	self.tripNameField = [[UITextField alloc] initWithFrame:CGRectMake(leftx+iconw+wgap1, hgap1, fw, fh)];
	_tripNameField.placeholder = NSLocalizedString(@"trip name", @"trip name");
	_tripNameField.autocorrectionType = UITextAutocorrectionTypeNo;
	_tripNameField.returnKeyType = UIReturnKeyDone;
	_tripNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _tripNameField.keyboardType = UIKeyboardTypeDefault;
    _tripNameField.tag = 0;
	_tripNameField.delegate = self;
	[self.view addSubview:_tripNameField];
    
	UIImageView *iconImgView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_ICON_TRIP_NAME]];
	iconImgView1.frame = CGRectMake(leftx, hgap1+fh/2-iconh/2, iconw, iconh);
	[self.view addSubview:iconImgView1];
	
	UIImageView *lineView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_LINE]];
	lineView1.frame = CGRectMake(SCREEN_WIDTH/2-linew/2, hgap1+fh, linew, lineh);
	[self.view addSubview:lineView1];
	
		// init begin date field.
	self.sDateField = [[UITextField alloc] initWithFrame:CGRectMake(leftx+iconw+wgap1, hgap1+fh+lineh, fw, fh)];
	_sDateField.placeholder = NSLocalizedString(@"trip begin date", @"trip begin date");
	_sDateField.autocorrectionType = UITextAutocorrectionTypeNo;
	_sDateField.returnKeyType = UIReturnKeyDone;
	_sDateField.clearButtonMode = UITextFieldViewModeWhileEditing;;
    _sDateField.tag = 1;
	_sDateField.delegate = self;
	[self.view addSubview:_sDateField];
	
	UIImageView *iconImgView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_ICON_BEGIN_DATE]];
	iconImgView2.frame = CGRectMake(leftx, hgap1+fh+lineh+fh/2-iconh/2, iconw, iconh);
	[self.view addSubview:iconImgView2];
	
	UIImageView *lineView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_LINE]];
	lineView2.frame = CGRectMake(SCREEN_WIDTH/2-linew/2, hgap1+fh+lineh+fh, linew, lineh);
	[self.view addSubview:lineView2];
	
		// init days count field.
	self.daysCountField = [[UITextField alloc] initWithFrame:CGRectMake(leftx+iconw+wgap1, hgap1+fh*2+lineh*2, fw, fh)];
	_daysCountField.placeholder = NSLocalizedString(@"trip days count", @"trip days count");
	_daysCountField.autocorrectionType = UITextAutocorrectionTypeNo;
	_daysCountField.returnKeyType = UIReturnKeyDone;
	_daysCountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _daysCountField.keyboardType = UIKeyboardTypeNumberPad;
    _daysCountField.tag = 2;
	_daysCountField.delegate = self;
	[self.view addSubview:_daysCountField];
	
	UIImageView *iconImgView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_ICON_DAYS_COUNT]];
	iconImgView3.frame = CGRectMake(leftx, hgap1+fh*2+lineh*2+fh/2-iconh/2, iconw, iconh);
	[self.view addSubview:iconImgView3];
	
	UIImageView *lineView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_LINE]];
	lineView3.frame = CGRectMake(SCREEN_WIDTH/2-linew/2, hgap1+fh*2+lineh*2+fh, linew, lineh);
	[self.view addSubview:lineView3];
    
    // button:Add destination.
    CGFloat dbw = 180.0;
    CGFloat dbh = 38.0;
    CGFloat gap2 = 40.0;
    UIButton *addDesBtn = [[UIButton alloc] init];
    addDesBtn.frame = CGRectMake(SCREEN_WIDTH/2-dbw/2, hgap1+fh*2+lineh*2+fh+lineh+gap2, dbw, dbh);
    [addDesBtn setBackgroundImage:[UIImage imageNamed:PIC_BTN_ADD_DESTINATION_N] forState:UIControlStateNormal];
    [addDesBtn setBackgroundImage:[UIImage imageNamed:PIC_BTN_ADD_DESTINATION_H] forState:UIControlStateHighlighted];
    [addDesBtn addTarget:self action:@selector(addDestination:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addDesBtn];
    
    // picker view.
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
    
    // init date picker
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *dFormatter = [[NSDateFormatter alloc] init];
    [dFormatter setDateFormat:@"yyyy"];
    NSString *currentYearStr = [dFormatter stringFromDate:nowdate];
    selectedYearRow = [yearsArray indexOfObject:currentYearStr];
    mlog(@"current year string : %@, at row %ld", currentYearStr, (long)selectedYearRow);
    
    [dFormatter setDateFormat:@"MM"];
    NSString *currentMonthStr = [dFormatter stringFromDate:nowdate];
    selectedMonthRow = [monthsArray indexOfObject:currentMonthStr];
    mlog(@"current month string : %@, at row %ld", currentMonthStr, (long)selectedMonthRow);
    
    [dFormatter setDateFormat:@"dd"];
    NSString *currentDayStr = [dFormatter stringFromDate:nowdate];
    selectedDayRow = [daysArray indexOfObject:currentDayStr];
    mlog(@"current day string : %@, at row %ld", currentDayStr, (long)selectedDayRow);
    
    [_datePickerView selectRow:selectedYearRow inComponent:0 animated:YES];
    [_datePickerView selectRow:selectedMonthRow inComponent:1 animated:YES];
    [_datePickerView selectRow:selectedDayRow inComponent:2 animated:YES];
}

- (void)initPickerData {
    yearsArray = [NSMutableArray arrayWithCapacity:50];
    for (int i = 1980; i <= 2100; i++) {
        [yearsArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    monthsArray = @[@"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12"];
    
    daysArray = [NSMutableArray arrayWithCapacity:31];
    for (int i = 1; i<=31; i++) {
        if (i < 10) {
            [daysArray addObject:[NSString stringWithFormat:@"0%d", i]];
        } else {
            [daysArray addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
													message:@"确定放弃？"
												   delegate:self
										  cancelButtonTitle:@"NO"
										  otherButtonTitles:@"YES", nil];
	alert.tag = 1;
	[alert show];
}

- (void)onClickOK:(id)sender {
	
	if (!_tripNameField.text || [_tripNameField.text length]==0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
														message:@"行程名称不能为空"
													   delegate:self
											  cancelButtonTitle:@"确定"
											  otherButtonTitles:nil];
		alert.tag = 2;
		[alert show];
		
		return;
	}
	
    [[WYDataEngine sharedDataEngine] cancelCreatingTrip];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onClickDateOK:(id)sender {
    NSString *ys = [yearsArray objectAtIndex:selectedYearRow];
    NSString *ms = [monthsArray objectAtIndex:selectedMonthRow];
    NSString *ds = [daysArray objectAtIndex:selectedDayRow];
    NSString *datestr = [NSString stringWithFormat:@"%@-%@-%@", ys, ms, ds];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    NSDate *sDate = [[NSDate alloc] init];
//    sDate = [dateFormatter dateFromString:datestr];
    
    [_sDateField setText:datestr];
    [_sDateField resignFirstResponder];
    UIResponder *nr = [_sDateField.superview viewWithTag:(_sDateField.tag+1)];
    if (nr) {
        [nr becomeFirstResponder];
    }
}

- (void)onClickDateCancel:(id)sender {
    [_sDateField resignFirstResponder];
}

- (void)dismissKeyboard:(id)sender {
    [_sDateField resignFirstResponder];
    [_daysCountField resignFirstResponder];
    [_tripNameField resignFirstResponder];
}

- (void)addDestination:(id)sender {
    WYCountriesController *cc = [[WYCountriesController alloc] init];
    [self.navigationController pushViewController:cc animated:YES];
}

#pragma mark - UIPicker Data Source & Delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [yearsArray count];
    } else if (component == 1) {
        return [monthsArray count];
    } else {
        
        if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 ||
            selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11) {
            
            return 31;
            
        } else if (selectedMonthRow == 3 || selectedMonthRow == 5 ||
                   selectedMonthRow == 8 || selectedMonthRow == 10) {
            
            return 30;
            
        } else {
            
            NSInteger currentYearInt = [[yearsArray objectAtIndex:selectedYearRow] integerValue];
            if ([WYFunctionUtility isLeapYear:currentYearInt]) {
                return 29;
            } else {
                return 28;
            }
            
        }
        
    }
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [yearsArray objectAtIndex:row];
    } else if (component == 1) {
        return [monthsArray objectAtIndex:row];
    } else {
        return [daysArray objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        selectedYearRow = row;
        [_datePickerView reloadComponent:2];
    } else if (component == 1) {
        selectedMonthRow = row;
        [_datePickerView reloadComponent:2];
    } else {
        selectedDayRow = row;
    }
}


#pragma mark - AlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag == 1) {
		if (buttonIndex == 0) {
				// do nothing.
		} else if (buttonIndex == 1) {
            [[WYDataEngine sharedDataEngine] cancelCreatingTrip];
			[self dismissViewControllerAnimated:YES completion:nil];
		}
	}
}

// ==
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
