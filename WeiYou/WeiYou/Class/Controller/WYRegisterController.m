//
//  WYRegisterController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYRegisterController.h"
#import "WYRegisterController2.h"
#import "WYURLUtility.h"
#import "SecurityUtil.h"
#import "NSObject+JSON.h"
#import "WYGlobalState.h"
#import "consts.h"

@interface WYRegisterController ()

- (void)rgsNextStep;

@end

@implementation WYRegisterController
@synthesize userField = _userField;
@synthesize passwdField = _passwdField;

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
	_userField = [[UITextField alloc] init];
	_userField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1, fw, fh);
	_userField.autocorrectionType = UITextAutocorrectionTypeNo;
	_userField.returnKeyType = UIReturnKeyDone;
	_userField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_userField.placeholder = NSLocalizedString(@"user phone number", @"user phone number");
	_userField.backgroundColor = [UIColor whiteColor];
	_userField.delegate = self;
	_userField.keyboardType = UIKeyboardTypeEmailAddress;
	[_userField setBorderStyle:UITextBorderStyleRoundedRect];
	
	_passwdField = [[UITextField alloc] init];
	_passwdField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh, fw, fh);
	_passwdField.autocorrectionType = UITextAutocorrectionTypeNo;
	_passwdField.returnKeyType = UIReturnKeyDone;
	_passwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_passwdField.placeholder = NSLocalizedString(@"password", @"password");
	_passwdField.backgroundColor = [UIColor whiteColor];
	_passwdField.delegate = self;
	_passwdField.keyboardType = UIKeyboardTypeEmailAddress;
	_passwdField.secureTextEntry = YES;
	[_passwdField setBorderStyle:UITextBorderStyleRoundedRect];
	
	[self.view addSubview:_userField];
	[self.view addSubview:_passwdField];
	
    CGFloat gaph2 = 25.0;
	CGFloat nw = 180.0;
	UIButton *nextBtn = [[UIButton alloc] init];
	nextBtn.frame = CGRectMake(SCREEN_WIDTH/2-nw/2, STATUS_BAR_H+NAV_BAR_H+gaph1+fh*3+gaph2, nw, fh);
	[nextBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[nextBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[nextBtn setTintColor:[UIColor redColor]];
	[nextBtn setTitle:NSLocalizedString(@"next step", @"next step") forState:UIControlStateNormal];
	[nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	nextBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	[nextBtn addTarget:self action:@selector(onClickNextStep:) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:nextBtn];
	
	UIButton *declareBtn = [[UIButton alloc] init];
	declareBtn.frame = CGRectMake(SCREEN_WIDTH/2-200/2, SCREEN_HEIGHT-60, 200, 60);
	[declareBtn setTitle:NSLocalizedString(@"register declare", @"register declare") forState:UIControlStateNormal];
	[declareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	declareBtn.titleLabel.font = [UIFont italicSystemFontOfSize:12];
	
	[self.view addSubview:declareBtn];

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
- (void)popBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)onClickNextStep:(id)sender {
    if (!_userField.text || [_userField.text length]==0) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"please input phone number" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
		return;
    }
    
    if (!_passwdField.text || [_passwdField.text length]==0) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"please input password" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
		return;
    }
    
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[infoDic setObject:_userField.text forKey:JSON_KEY_TEL];
	[infoDic setObject:[WYGlobalState getUUID] forKey:JSON_KEY_UID];
	
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getWYSendMsgURL]];
	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"smsdata"];
	request.delegate = self;
	[request startAsynchronous];
}

#pragma mark - HTTP
- (void)requestFinished:(ASIHTTPRequest *)request {
	NSString *response = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
	mlog(@"== WY Login Response : \n%@", response);
	
	NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
	mlog(@"== WY Login Response info dic : \n%@", [infoDic description]);
	
	NSNumber *state = [infoDic objectForKey:JSON_KEY_RES_ST];
	if ([state intValue] == 0) {
        [self performSelectorOnMainThread:@selector(rgsNextStep) withObject:nil waitUntilDone:NO];
        mlog(@"== WY Login Success & msg : %@", [infoDic objectForKey:JSON_KEY_RES_MSG]);
	} else {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:[infoDic objectForKey:JSON_KEY_RES_MSG] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	mlog(@"== WY Login Failed & Response : %@", [request.responseData description]);
}

#pragma mark - private
- (void)rgsNextStep {
    WYRegisterController2 *rc = [[WYRegisterController2 alloc] init];
    [self.navigationController pushViewController:rc animated:YES];
}

@end
