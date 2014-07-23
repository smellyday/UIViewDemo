//
//  WYLoginController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYLoginController.h"
#import "WYRegisterController.h"
#import "WYFindPasswordController.h"
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
    [self.view addSubview:containerScrollView];
	
	UILabel *welcomeLabel = [[UILabel alloc] init];
	welcomeLabel.frame = CGRectMake(60, 30, 200, 50);
	[welcomeLabel setText:NSLocalizedString(@"welcome", @"welcome")];
	[welcomeLabel setTextAlignment:NSTextAlignmentCenter];
	[welcomeLabel setTextColor:[UIColor whiteColor]];
	welcomeLabel.font = [UIFont systemFontOfSize:38];
	[containerScrollView addSubview:welcomeLabel];
	
	_userField = [[UITextField alloc] init];
	_userField.frame = CGRectMake(28, 130, 264, 40);
	_userField.autocorrectionType = UITextAutocorrectionTypeNo;
	_userField.returnKeyType = UIReturnKeyDone;
	_userField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_userField.placeholder = NSLocalizedString(@"user name", @"user name");
	_userField.backgroundColor = [UIColor whiteColor];
	_userField.delegate = self;
	[_userField setBorderStyle:UITextBorderStyleRoundedRect];
	[containerScrollView addSubview:_userField];
	
	_passwdField = [[UITextField alloc] init];
	_passwdField.frame = CGRectMake(28, 170, 264, 40);
	_passwdField.autocorrectionType = UITextAutocorrectionTypeNo;
	_passwdField.returnKeyType = UIReturnKeyDone;
	_passwdField.clearButtonMode = UITextFieldViewModeWhileEditing;
	_passwdField.placeholder = NSLocalizedString(@"password", @"password");
	_passwdField.backgroundColor = [UIColor whiteColor];
	_passwdField.delegate = self;
	[_passwdField setBorderStyle:UITextBorderStyleRoundedRect];
	[containerScrollView addSubview:_passwdField];
	
	CGFloat w = 250.0;
	CGFloat h = 40.0;
	UIButton *loginBtn = [[UIButton alloc] init];
	loginBtn.frame = CGRectMake(SCREEN_WIDTH/2-w/2, 230, w, h);
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[loginBtn setTintColor:[UIColor redColor]];
	loginBtn.showsTouchWhenHighlighted = YES;
	[loginBtn setTitle:NSLocalizedString(@"login", @"login") forState:UIControlStateNormal];
	[loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	[containerScrollView addSubview:loginBtn];
	
	UIButton *weiboBtn = [[UIButton alloc] init];
	weiboBtn.frame = CGRectMake(SCREEN_WIDTH/2-w/2, 300, 120, h);
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_N] forState:UIControlStateNormal];
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_H] forState:UIControlStateHighlighted];
	[containerScrollView addSubview:weiboBtn];
	
	UIButton *qqBtn = [[UIButton alloc] init];
	qqBtn.frame = CGRectMake(SCREEN_WIDTH-(SCREEN_WIDTH-w)/2-120, 300, 120, h);
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_N] forState:UIControlStateNormal];
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_H] forState:UIControlStateHighlighted];
	[containerScrollView addSubview:qqBtn];
    
	UIButton *forgetPWBtn = [[UIButton alloc] init];
	forgetPWBtn.frame = CGRectMake(SCREEN_WIDTH/2-60/2, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_H-60, 60, 30);
	forgetPWBtn.showsTouchWhenHighlighted = YES;
	[forgetPWBtn setTitle:NSLocalizedString(@"forget password", @"forget password") forState:UIControlStateNormal];
	[forgetPWBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forgetPWBtn.titleLabel.font = [UIFont systemFontOfSize:13];
	[containerScrollView addSubview:forgetPWBtn];
	
    /*
    self.title = @"登录";
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToSetting:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
    
    UIScrollView *containerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    containerScrollView.scrollEnabled = YES;
    containerScrollView.bounces = YES;
    containerScrollView.alwaysBounceHorizontal = NO;
    [self.view addSubview:containerScrollView];
    
    UIButton *sinaLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sinaLoginButton.frame = CGRectMake(35, 20, 250, 40);
    sinaLoginButton.backgroundColor = [UIColor redColor];
    sinaLoginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [sinaLoginButton setTitle:@"新浪微博登录" forState:UIControlStateNormal];
    [sinaLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containerScrollView addSubview:sinaLoginButton];
    [sinaLoginButton addTarget:self action:@selector(loginWithSina:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *qqLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    qqLoginButton.frame = CGRectMake(35, 65, 250, 40);
    qqLoginButton.backgroundColor = [UIColor blueColor];
    qqLoginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [qqLoginButton setTitle:@"QQ帐号登录" forState:UIControlStateNormal];
    [qqLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containerScrollView addSubview:qqLoginButton];
    
    UITextField *userNameField = [[UITextField alloc] initWithFrame:CGRectMake(35, 115, 250, 40)];
    userNameField.borderStyle = UITextBorderStyleRoundedRect;
    userNameField.placeholder = @"用户名";
    [containerScrollView addSubview:userNameField];
    
    UITextField *pwNameField = [[UITextField alloc] initWithFrame:CGRectMake(35, 160, 250, 40)];
    pwNameField.borderStyle = UITextBorderStyleRoundedRect;
    pwNameField.placeholder = @"密码";
    [containerScrollView addSubview:pwNameField];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(35, 205, 250, 40);
    loginButton.backgroundColor = [UIColor greenColor];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [containerScrollView addSubview:loginButton];
    
    UIButton *forgetPWButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPWButton.frame = CGRectMake(35, 250, 50, 20);
    forgetPWButton.backgroundColor = [UIColor clearColor];
    forgetPWButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [forgetPWButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPWButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [containerScrollView addSubview:forgetPWButton];
    [forgetPWButton addTarget:self action:@selector(forgetPassword:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(255, 250, 30, 20);
    registerButton.backgroundColor = [UIColor clearColor];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [containerScrollView addSubview:registerButton];
    [registerButton addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
    */
}

- (void)loginWithSina:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = SinaRedirectUrl;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)backToSetting:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registerUser:(id)sender {
    WYRegisterController *rc = [[WYRegisterController alloc] init];
    [self.navigationController pushViewController:rc animated:YES];
}

- (void)forgetPassword:(id)sender {
    WYFindPasswordController *fpc = [[WYFindPasswordController alloc] init];
    [self.navigationController pushViewController:fpc animated:YES];
}

#pragma UIButton Event
- (void)clickCancelButton:(id)button {
	[self dismissViewControllerAnimated:YES completion:nil];
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
