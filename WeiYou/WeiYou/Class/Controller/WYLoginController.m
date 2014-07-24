//
//  WYLoginController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYLoginController.h"
#import "WYRegisterController.h"
#import "WYResetPasswordViewController.h"
#import "consts.h"

@interface WYLoginController ()

@end

@implementation WYLoginController
@synthesize userField = _userField;
@synthesize passwdField = _passwdField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
	
	UIButton *registerBtn = [[UIButton alloc] init];
	registerBtn.frame = NAV_BAR_RIGHT_BTN_FRAME;
	[registerBtn setBackgroundColor:[UIColor clearColor]];
	[registerBtn setTitle:NSLocalizedString(@"register", @"register") forState:UIControlStateNormal];
	[registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	registerBtn.titleLabel.font = [UIFont systemFontOfSize:17];
	[registerBtn addTarget:self action:@selector(clickRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
	registerBtn.showsTouchWhenHighlighted = YES;
	
	UILabel *loginTitle = [[UILabel alloc] init];
	loginTitle.frame = NAV_BAR_TITLE_FRAME;
	[loginTitle setText:NSLocalizedString(@"login", @"login")];
	[loginTitle setTextAlignment:NSTextAlignmentCenter];
	[loginTitle setTextColor:[UIColor whiteColor]];
	loginTitle.font = [UIFont systemFontOfSize:19];
	
	UIView *topBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, self.view.frame.size.width, NAV_BAR_H)];
	topBarContainer.backgroundColor = [UIColor clearColor];
	[topBarContainer addSubview:cancelBtn];
	[topBarContainer addSubview:registerBtn];
	[topBarContainer addSubview:loginTitle];
	[self.view addSubview:topBarContainer];
    
	//main content
	UIScrollView *containerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H+NAV_BAR_H, self.view.frame.size.width, self.view.frame.size.height-(STATUS_BAR_H+NAV_BAR_H))];
    containerScrollView.scrollEnabled = YES;
    containerScrollView.bounces = YES;
    containerScrollView.alwaysBounceHorizontal = NO;
	containerScrollView.backgroundColor = [UIColor clearColor];
    containerScrollView.delaysContentTouches = NO;
    [self.view addSubview:containerScrollView];
	
	UILabel *welcomeLabel = [[UILabel alloc] init];
	welcomeLabel.frame = CGRectMake(60, 30, 200, 50);
	[welcomeLabel setText:NSLocalizedString(@"welcome", @"welcome")];
	[welcomeLabel setTextAlignment:NSTextAlignmentCenter];
	[welcomeLabel setTextColor:[UIColor whiteColor]];
	welcomeLabel.font = [UIFont systemFontOfSize:38];
	[containerScrollView addSubview:welcomeLabel];
	
    CGFloat gaph1 = 156.0;
    CGFloat fw = 264.0;
    CGFloat fh = 40.0;
	_userField = [[UITextField alloc] init];
	_userField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, gaph1, fw, fh);
	_userField.autocorrectionType = UITextAutocorrectionTypeNo;
	_userField.returnKeyType = UIReturnKeyDone;
	_userField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_userField.placeholder = NSLocalizedString(@"user name", @"user name");
	_userField.backgroundColor = [UIColor whiteColor];
	_userField.delegate = self;
	_userField.keyboardType = UIKeyboardTypeEmailAddress;
	[_userField setBorderStyle:UITextBorderStyleRoundedRect];
	[containerScrollView addSubview:_userField];
	
	_passwdField = [[UITextField alloc] init];
	_passwdField.frame = CGRectMake(SCREEN_WIDTH/2-fw/2, gaph1+fh, fw, fh);
	_passwdField.autocorrectionType = UITextAutocorrectionTypeNo;
	_passwdField.returnKeyType = UIReturnKeyDone;
	_passwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_passwdField.placeholder = NSLocalizedString(@"password", @"password");
	_passwdField.backgroundColor = [UIColor whiteColor];
	_passwdField.delegate = self;
	_passwdField.secureTextEntry = YES;
	_passwdField.keyboardType = UIKeyboardTypePhonePad;
	[_passwdField setBorderStyle:UITextBorderStyleRoundedRect];
	[containerScrollView addSubview:_passwdField];
	
    CGFloat gaph2 = 47.0;
	CGFloat lbw = 264.0;
	CGFloat lbh = 40.0;
	UIButton *loginBtn = [[UIButton alloc] init];
	loginBtn.frame = CGRectMake(SCREEN_WIDTH/2-lbw/2, gaph1+fh*2+gaph2, lbw, lbh);
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[loginBtn setTintColor:[UIColor redColor]];
	[loginBtn setTitle:NSLocalizedString(@"login", @"login") forState:UIControlStateNormal];
	[loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	[containerScrollView addSubview:loginBtn];
	
    CGFloat gaph3 = 19.0;
    CGFloat wqbw = 127;
    CGFloat wqbh = 35;
	UIButton *weiboBtn = [[UIButton alloc] init];
	weiboBtn.frame = CGRectMake(SCREEN_WIDTH/2-lbw/2, gaph1+fh*2+gaph2+lbh+gaph3, wqbw, wqbh);
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_N] forState:UIControlStateNormal];
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_H] forState:UIControlStateHighlighted];
    weiboBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 35, 0, 0);
	[weiboBtn setTitle:NSLocalizedString(@"login with sina weibo", @"login with sina weibo") forState:UIControlStateNormal];
	[weiboBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	weiboBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [weiboBtn addTarget:self action:@selector(clickSinaLoginButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:weiboBtn];
	
	UIButton *qqBtn = [[UIButton alloc] init];
	qqBtn.frame = CGRectMake(SCREEN_WIDTH-(SCREEN_WIDTH-lbw)/2-wqbw, gaph1+fh*2+gaph2+lbh+gaph3, wqbw, wqbh);
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_N] forState:UIControlStateNormal];
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_H] forState:UIControlStateHighlighted|UIControlStateSelected];
    qqBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 35, 0, 0);
	[qqBtn setTitle:NSLocalizedString(@"login with qq", @"login with qq") forState:UIControlStateNormal];
	[qqBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	qqBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [weiboBtn addTarget:self action:@selector(clickQQLoginButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:qqBtn];
    
	UIButton *forgetPWBtn = [[UIButton alloc] init];
	forgetPWBtn.frame = CGRectMake(SCREEN_WIDTH/2-60/2, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_H-60, 60, 60);
	forgetPWBtn.showsTouchWhenHighlighted = YES;
	[forgetPWBtn setTitle:NSLocalizedString(@"forget password", @"forget password") forState:UIControlStateNormal];
	[forgetPWBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forgetPWBtn.titleLabel.font = [UIFont systemFontOfSize:13];
	[forgetPWBtn addTarget:self action:@selector(clickForgetPWButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:forgetPWBtn];
	
}


- (void)backToSetting:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registerUser:(id)sender {
    WYRegisterController *rc = [[WYRegisterController alloc] init];
    [self.navigationController pushViewController:rc animated:YES];
}

#pragma UIButton Event
- (void)clickSinaLoginButton:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = SinaRedirectUrl;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)clickQQLoginButton:(id)sender {
    
}

- (void)clickCancelButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickRegisterButton:(id)sender {
	WYRegisterController *rc = [[WYRegisterController alloc] init];
	[self.navigationController pushViewController:rc animated:YES];
}

- (void)clickForgetPWButton:(id)sender {
    WYResetPasswordViewController *rpv = [[WYResetPasswordViewController alloc] init];
    [self.navigationController pushViewController:rpv animated:YES];
}


#pragma UITextField Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}


#pragma -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
