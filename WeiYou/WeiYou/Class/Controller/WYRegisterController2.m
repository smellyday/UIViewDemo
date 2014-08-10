//
//  WYRegisterController2.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYRegisterController2.h"
#import "WYGlobalState.h"
#import "WYURLUtility.h"
#import "SecurityUtil.h"
#import "NSObject+JSON.h"
#import "WYFakeNavBar.h"
#import "consts.h"

@interface WYRegisterController2 ()

@end

@implementation WYRegisterController2
@synthesize phoneNumber = _phoneNumber;
@synthesize password = _password;
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
	
    // nav bar
	UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = NAV_BAR_LEFT_BTN_FRAME;
	[cancelBtn setBackgroundImage:[UIImage imageNamed:PIC_BACK_N] forState:UIControlStateNormal];
	[cancelBtn addTarget:self action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
	
	UILabel *registerTitle = [[UILabel alloc] init];
	registerTitle.frame = NAV_BAR_TITLE_FRAME;
	[registerTitle setText:NSLocalizedString(@"register", @"register")];
	[registerTitle setTextAlignment:NSTextAlignmentCenter];
	[registerTitle setTextColor:[UIColor whiteColor]];
	registerTitle.font = [UIFont systemFontOfSize:19];
	
    WYFakeNavBar *fakeNavBar = [[WYFakeNavBar alloc] init];
	fakeNavBar.backgroundColor = [UIColor clearColor];
	[fakeNavBar addSubview:cancelBtn];
	[fakeNavBar addSubview:registerTitle];
	[self.view addSubview:fakeNavBar];
	
		//main content
    CGFloat gaph1 = 100.0;
    CGFloat fw = 264.0;
    CGFloat fh = 40.0;
	UITextField *phoneNumberField = [[UITextField alloc] init];
	phoneNumberField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1, fw, fh);
	phoneNumberField.autocorrectionType = UITextAutocorrectionTypeNo;
	phoneNumberField.returnKeyType = UIReturnKeyDone;
	phoneNumberField.clearButtonMode = UITextFieldViewModeWhileEditing;
	phoneNumberField.backgroundColor = [UIColor whiteColor];
	phoneNumberField.enabled = NO;
	phoneNumberField.keyboardType = UIKeyboardTypeEmailAddress;
	[phoneNumberField setBorderStyle:UITextBorderStyleRoundedRect];
    if (_phoneNumber && [_phoneNumber length]>0) {
        phoneNumberField.text = _phoneNumber;
    }
	
	_verifyField = [[UITextField alloc] init];
	_verifyField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh, fw, fh);
	_verifyField.autocorrectionType = UITextAutocorrectionTypeNo;
	_verifyField.returnKeyType = UIReturnKeyDone;
	_verifyField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_verifyField.placeholder = NSLocalizedString(@"verify code", @"verify code");
	_verifyField.backgroundColor = [UIColor whiteColor];
	_verifyField.delegate = self;
	_verifyField.keyboardType = UIKeyboardTypePhonePad;
	_verifyField.secureTextEntry = YES;
	[_verifyField setBorderStyle:UITextBorderStyleRoundedRect];
	
	[self.view addSubview:phoneNumberField];
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
    [okBtn addTarget:self action:@selector(onClickRegButton:) forControlEvents:UIControlEventTouchUpInside];
	
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

- (void)onClickRegButton:(id)sender {
    if (!_phoneNumber || [_phoneNumber length]==0) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert"
                                                            message:@"There must be something wrong."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:nil];
        [alertview show];
		return;
    }
    
    if (!_verifyField.text || [_verifyField.text length]==0) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert"
                                                            message:@"please input verify code"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:nil];
        [alertview show];
		return;
    }
    
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[infoDic setObject:_phoneNumber forKey:JSON_BODY_KEY_TEL];
	[infoDic setObject:_password forKey:JSON_BODY_KEY_PWD];
	[infoDic setObject:_verifyField.text forKey:JSON_BODY_KEY_SMS];
	
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getWYRegURL]];
	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"regdata"];
	request.delegate = self;
	[request startAsynchronous];
}

#pragma mark - HTTP
- (void)requestFinished:(ASIHTTPRequest *)request {
	NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
	mlog(@"== WY Register Response info dic : \n%@", [infoDic description]);
	
	NSNumber *state = [infoDic objectForKey:JSON_RES_KEY_ST];
	if ([state intValue] == 0) {
		[[[WYGlobalState sharedGlobalState] wyUserInfo] setAuthToken:[infoDic objectForKey:JSON_RES_KEY_UT]];
		[[NSNotificationCenter defaultCenter] postNotificationName:NOTI_WY_REG_OK object:nil userInfo:nil];
        mlog(@"== WY Register Success & msg : %@", [infoDic objectForKey:JSON_RES_KEY_MSG]);
	} else {
		UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert"
                                                            message:[infoDic objectForKey:JSON_RES_KEY_MSG]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:nil];
        [alertview show];
	}
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    LOGFUNCTION;
    mlog(@"== WY Login Failed Response : %@", [request.error description]);
    NSError *error = request.error;
    if (error.code == 1) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"Connection Failure Occur!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
    }
}

@end
