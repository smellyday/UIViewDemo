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
	CGFloat gap1 = 30.0;
	CGFloat fw = 280.0;
	CGFloat fh = 50.0;
	CGFloat leftx = 20.0;
	self.tripNameField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1, fw, fh)];
	_tripNameField.placeholder = NSLocalizedString(@"trip name", @"trip name");
	_tripNameField.autocorrectionType = UITextAutocorrectionTypeNo;
	_tripNameField.returnKeyType = UIReturnKeyDone;
	_tripNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _tripNameField.keyboardType = UIKeyboardTypeDefault;
    _tripNameField.tag = 0;
	_tripNameField.delegate = self;
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
	_sDateField.clearButtonMode = UITextFieldViewModeWhileEditing;;
    _sDateField.tag = 1;
	_sDateField.delegate = self;
	[self.view addSubview:_sDateField];
	
	self.daysCountField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1+fh*2, fw, fh)];
	_daysCountField.placeholder = NSLocalizedString(@"trip days count", @"trip days count");
	_daysCountField.autocorrectionType = UITextAutocorrectionTypeNo;
	_daysCountField.returnKeyType = UIReturnKeyDone;
	_daysCountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _daysCountField.keyboardType = UIKeyboardTypeNumberPad;
    _daysCountField.tag = 2;
	_daysCountField.delegate = self;
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
    
    // init date picker
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *dFormatter = [[NSDateFormatter alloc] init];
    [dFormatter setDateFormat:@"yyyy"];
    NSString *currentYearStr = [dFormatter stringFromDate:nowdate];
    selectedYearRow = [yearsArray indexOfObject:currentYearStr];
    mlog(@"current year string : %@, at row %d", currentYearStr, selectedYearRow);
    
    [dFormatter setDateFormat:@"MM"];
    NSString *currentMonthStr = [dFormatter stringFromDate:nowdate];
    selectedMonthRow = [monthsArray indexOfObject:currentMonthStr];
    mlog(@"current month string : %@, at row %d", currentMonthStr, selectedMonthRow);
    
    [dFormatter setDateFormat:@"dd"];
    NSString *currentDayStr = [dFormatter stringFromDate:nowdate];
    selectedDayRow = [daysArray indexOfObject:currentDayStr];
    mlog(@"current day string : %@, at row %d", currentDayStr, selectedDayRow);
    
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
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onClickOK:(id)sender {
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


// ==
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
