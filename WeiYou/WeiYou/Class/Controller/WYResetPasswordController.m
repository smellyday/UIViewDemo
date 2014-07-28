//
//  WYResetPasswordController.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYResetPasswordController.h"
#import "WYResetPasswordController2.h"
#import "consts.h"

@interface WYResetPasswordController ()

@end

@implementation WYResetPasswordController
@synthesize userPhoneNumberField = _userPhoneNumberField;


- (void)viewDidLoad
{
    [super viewDidLoad];
		// background
    self.view.backgroundColor = [UIColor whiteColor]; // can not be clearColor
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_LOGIN_BG]];
    bg.frame = self.view.bounds;
    bg.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:bg atIndex:0];
	
		// fake navigation bar
	UIButton *cancelBtn = [[UIButton alloc] init];
	cancelBtn.frame = NAV_BAR_LEFT_BTN_FRAME;
	[cancelBtn setBackgroundColor:[UIColor clearColor]];
	[cancelBtn setTitle:NSLocalizedString(@"cancel", @"cancel") forState:UIControlStateNormal];
	[cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	cancelBtn.titleLabel.font = [UIFont systemFontOfSize:17];
	cancelBtn.showsTouchWhenHighlighted = YES;
	[cancelBtn addTarget:self action:@selector(clickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
	
	UILabel *resetPWTitle = [[UILabel alloc] init];
	resetPWTitle.frame = NAV_BAR_TITLE_FRAME;
	[resetPWTitle setText:NSLocalizedString(@"reset password", @"reset password")];
	[resetPWTitle setTextAlignment:NSTextAlignmentCenter];
	[resetPWTitle setTextColor:[UIColor whiteColor]];
	resetPWTitle.font = [UIFont systemFontOfSize:19];
	
	UIView *topBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, self.view.frame.size.width, NAV_BAR_H)];
	topBarContainer.backgroundColor = [UIColor clearColor];
	[topBarContainer addSubview:cancelBtn];
	[topBarContainer addSubview:resetPWTitle];
	[self.view addSubview:topBarContainer];
	
		// content
	CGFloat gaph1 = 100.0;
    CGFloat fw = 264.0;
    CGFloat fh = 40.0;
	_userPhoneNumberField = [[UITextField alloc] init];
	_userPhoneNumberField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1, fw, fh);
	_userPhoneNumberField.autocorrectionType = UITextAutocorrectionTypeNo;
	_userPhoneNumberField.returnKeyType = UIReturnKeyDone;
	_userPhoneNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_userPhoneNumberField.placeholder = NSLocalizedString(@"user phone number", @"user phone number");
	_userPhoneNumberField.backgroundColor = [UIColor whiteColor];
	_userPhoneNumberField.delegate = self;
	_userPhoneNumberField.keyboardType = UIKeyboardTypePhonePad;
	[_userPhoneNumberField setBorderStyle:UITextBorderStyleRoundedRect];
	[self.view addSubview:_userPhoneNumberField];
	
	CGFloat gaph2 = 25.0;
	CGFloat lbw = 180.0;
	CGFloat lbh = 38.0;
	UIButton *nextBtn = [[UIButton alloc] init];
	nextBtn.frame = CGRectMake(SCREEN_WIDTH/2-lbw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh+gaph2, lbw, lbh);
	[nextBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[nextBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[nextBtn setTintColor:[UIColor redColor]];
	[nextBtn setTitle:NSLocalizedString(@"next step", @"next step") forState:UIControlStateNormal];
	[nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	nextBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	[nextBtn addTarget:self action:@selector(onClickNextStepBtn:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:nextBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

#pragma mark - UIButton Event
- (void)clickCancelButton:(id)button {
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma UITextField Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - onClick
- (void)onClickNextStepBtn:(id)sender {
	WYResetPasswordController2 *resetVC = [[WYResetPasswordController2 alloc] init];
	[self.navigationController pushViewController:resetVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
