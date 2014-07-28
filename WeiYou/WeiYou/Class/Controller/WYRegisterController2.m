//
//  WYRegisterController2.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYRegisterController2.h"
#import "consts.h"

@interface WYRegisterController2 ()

@end

@implementation WYRegisterController2
@synthesize phoneNumberField = _phoneNumberField;
@synthesize verifyField = _verifyField;

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
	[cancelBtn addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
	
	UILabel *registerTitle = [[UILabel alloc] init];
	registerTitle.frame = NAV_BAR_TITLE_FRAME;
	[registerTitle setText:NSLocalizedString(@"register", @"register")];
	[registerTitle setTextAlignment:NSTextAlignmentCenter];
	[registerTitle setTextColor:[UIColor whiteColor]];
	registerTitle.font = [UIFont systemFontOfSize:19];
	
	UIView *topBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, self.view.frame.size.width, NAV_BAR_H)];
	topBarContainer.backgroundColor = [UIColor clearColor];
	[topBarContainer addSubview:cancelBtn];
	[topBarContainer addSubview:registerTitle];
	[self.view addSubview:topBarContainer];
	
		//main content
    CGFloat gaph1 = 100.0;
    CGFloat fw = 264.0;
    CGFloat fh = 40.0;
	_phoneNumberField = [[UITextField alloc] init];
	_phoneNumberField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1, fw, fh);
	_phoneNumberField.autocorrectionType = UITextAutocorrectionTypeNo;
	_phoneNumberField.returnKeyType = UIReturnKeyDone;
	_phoneNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
//	_phoneNumberField.placeholder = NSLocalizedString(@"user phone number", @"user phone number");
	_phoneNumberField.backgroundColor = [UIColor whiteColor];
	_phoneNumberField.delegate = self;
	_phoneNumberField.enabled = NO;
	_phoneNumberField.keyboardType = UIKeyboardTypeEmailAddress;
	[_phoneNumberField setBorderStyle:UITextBorderStyleRoundedRect];
	
	_verifyField = [[UITextField alloc] init];
	_verifyField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh, fw, fh);
	_verifyField.autocorrectionType = UITextAutocorrectionTypeNo;
	_verifyField.returnKeyType = UIReturnKeyDone;
	_verifyField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_verifyField.placeholder = NSLocalizedString(@"verify code", @"verify code");
	_verifyField.backgroundColor = [UIColor whiteColor];
	_verifyField.delegate = self;
	_verifyField.keyboardType = UIKeyboardTypeEmailAddress;
	_verifyField.secureTextEntry = YES;
	[_verifyField setBorderStyle:UITextBorderStyleRoundedRect];
	
	[self.view addSubview:_phoneNumberField];
	[self.view addSubview:_verifyField];
	
    CGFloat gaph2 = 25.0;
	CGFloat nw = 180.0;
	UIButton *okBtn = [[UIButton alloc] init];
	okBtn.frame = CGRectMake(SCREEN_WIDTH/2-nw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh*3+gaph2, nw, fh);
	[okBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[okBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[okBtn setTintColor:[UIColor redColor]];
	[okBtn setTitle:NSLocalizedString(@"ok", @"ok") forState:UIControlStateNormal];
	[okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	okBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	
	[self.view addSubview:okBtn];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

#pragma UITextField Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - UIButton Event
- (void)popBack:(id)button {
	[self.navigationController popToRootViewControllerAnimated:YES];
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
