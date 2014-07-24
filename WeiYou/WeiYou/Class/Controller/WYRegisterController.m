//
//  WYRegisterController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYRegisterController.h"
#import "consts.h"

@interface WYRegisterController ()

@end

@implementation WYRegisterController
@synthesize userField = _userField;
@synthesize passwdField = _passwdField;
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
	[cancelBtn addTarget:self action:@selector(clickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
	
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
	_userField = [[UITextField alloc] init];
	_userField.frame = CGRectMake(28, STATUS_BAR_H+NAV_BAR_H+50, 264, 40);
	_userField.autocorrectionType = UITextAutocorrectionTypeNo;
	_userField.returnKeyType = UIReturnKeyDone;
	_userField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_userField.placeholder = NSLocalizedString(@"user name", @"user name");
	_userField.backgroundColor = [UIColor whiteColor];
	_userField.delegate = self;
	_verifyField.keyboardType = UIKeyboardTypeEmailAddress;
	[_userField setBorderStyle:UITextBorderStyleRoundedRect];
	
	_passwdField = [[UITextField alloc] init];
	_passwdField.frame = CGRectMake(28, STATUS_BAR_H+NAV_BAR_H+90, 264, 40);
	_passwdField.autocorrectionType = UITextAutocorrectionTypeNo;
	_passwdField.returnKeyType = UIReturnKeyDone;
	_passwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_passwdField.placeholder = NSLocalizedString(@"password", @"password");
	_passwdField.backgroundColor = [UIColor whiteColor];
	_passwdField.delegate = self;
	_verifyField.keyboardType = UIKeyboardTypeEmailAddress;
	_passwdField.secureTextEntry = YES;
	[_passwdField setBorderStyle:UITextBorderStyleRoundedRect];
	
	_verifyField = [[UITextField alloc] init];
	_verifyField.frame = CGRectMake(28, STATUS_BAR_H+NAV_BAR_H+130, 264, 40);
	_verifyField.autocorrectionType = UITextAutocorrectionTypeNo;
	_verifyField.returnKeyType = UIReturnKeyDone;
	_verifyField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_verifyField.placeholder = NSLocalizedString(@"verify code", @"verify code");
	_verifyField.backgroundColor = [UIColor whiteColor];
	_verifyField.delegate = self;
	_verifyField.keyboardType = UIKeyboardTypePhonePad;
	[_verifyField setBorderStyle:UITextBorderStyleRoundedRect];
	
	[self.view addSubview:_userField];
	[self.view addSubview:_passwdField];
	[self.view addSubview:_verifyField];
	
	CGFloat w = 250.0;
	CGFloat h = 40.0;
	UIButton *registerBtn = [[UIButton alloc] init];
	registerBtn.frame = CGRectMake(SCREEN_WIDTH/2-w/2, STATUS_BAR_H+NAV_BAR_H+170+20, w, h);
	[registerBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[registerBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[registerBtn setTintColor:[UIColor redColor]];
	registerBtn.showsTouchWhenHighlighted = YES;
	[registerBtn setTitle:NSLocalizedString(@"register", @"register") forState:UIControlStateNormal];
	[registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	registerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	
	[self.view addSubview:registerBtn];
	
	UIButton *declareBtn = [[UIButton alloc] init];
	declareBtn.frame = CGRectMake(SCREEN_WIDTH/2-200/2, SCREEN_HEIGHT-60, 200, 60);
	declareBtn.showsTouchWhenHighlighted = YES;
	[declareBtn setTitle:NSLocalizedString(@"register declare", @"register declare") forState:UIControlStateNormal];
	[declareBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	declareBtn.titleLabel.font = [UIFont italicSystemFontOfSize:12];
	
	[self.view addSubview:declareBtn];

    
	/*
    self.title = @"注册";
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToLogin:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
    
    UIButton *mailRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    mailRegisterButton.frame = CGRectMake(35, 150, 250, 40);
    mailRegisterButton.backgroundColor = [UIColor redColor];
    mailRegisterButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [mailRegisterButton setTitle:@"邮箱注册" forState:UIControlStateNormal];
    [mailRegisterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:mailRegisterButton];
    
    UIButton *phoneRegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneRegisterButton.frame = CGRectMake(35, 200, 250, 40);
    phoneRegisterButton.backgroundColor = [UIColor blueColor];
    phoneRegisterButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [phoneRegisterButton setTitle:@"电话号码注册" forState:UIControlStateNormal];
    [phoneRegisterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:phoneRegisterButton];
	 */
}

- (void)backToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
- (void)clickCancelButton:(id)button {
	[self.navigationController popViewControllerAnimated:YES];
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
