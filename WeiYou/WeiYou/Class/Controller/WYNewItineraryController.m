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
	
	self.daysCountField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1+fh, fw, fh)];
	_daysCountField.placeholder = NSLocalizedString(@"trip begin date", @"trip begin date");
	_daysCountField.autocorrectionType = UITextAutocorrectionTypeNo;
	_daysCountField.returnKeyType = UIReturnKeyDone;
	_daysCountField.clearButtonMode = UITextFieldViewModeWhileEditing;
	[self.view addSubview:_daysCountField];
	
	self.sDateField = [[UITextField alloc] initWithFrame:CGRectMake(leftx, gap1+fh*2, fw, fh)];
	_sDateField.placeholder = NSLocalizedString(@"trip days count", @"trip days count");
	_sDateField.autocorrectionType = UITextAutocorrectionTypeNo;
	_sDateField.returnKeyType = UIReturnKeyDone;
	_sDateField.clearButtonMode = UITextFieldViewModeWhileEditing;
	[self.view addSubview:_sDateField];
	
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}


- (void)onClickOK:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
