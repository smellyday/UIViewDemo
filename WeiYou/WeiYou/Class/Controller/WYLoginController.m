//
//  WYLoginController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-19.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYLoginController.h"
#import "WYRegisterController.h"
#import "WYResetPasswordController.h"
#import "WYGlobalState.h"
#import "WeiboSDK.h"
#import "consts.h"
#import "SecurityUtil.h"
#import "WYURLUtility.h"
#import "NSObject+JSON.h"
#import "WYFakeNavBar.h"

@interface WYLoginController ()

@end

@implementation WYLoginController
@synthesize userField = _userField;
@synthesize passwdField = _passwdField;
@synthesize tcOAuth = _tcOAuth;

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
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
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
	
    WYFakeNavBar *fakeNavBar = [[WYFakeNavBar alloc] init];
	fakeNavBar.backgroundColor = [UIColor clearColor];
	[fakeNavBar addSubview:cancelBtn];
	[fakeNavBar addSubview:loginTitle];
	[fakeNavBar addSubview:registerBtn];
	[self.view addSubview:fakeNavBar];
    
	//main content
	UIScrollView *containerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H+NAV_BAR_H, self.view.frame.size.width, self.view.frame.size.height-(STATUS_BAR_H+NAV_BAR_H))];
    containerScrollView.scrollEnabled = YES;
    containerScrollView.bounces = YES;
    containerScrollView.alwaysBounceHorizontal = NO;
	containerScrollView.backgroundColor = [UIColor clearColor];
    containerScrollView.delaysContentTouches = NO;
    [self.view addSubview:containerScrollView];
	
    CGFloat gaph1 = 100.0;
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
	_userField.text = @"13402112880";
	
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
	_passwdField.text = @"123456";
	
    CGFloat gaph2 = 25.0;
	CGFloat lbw = 180.0;
	CGFloat lbh = 38.0;
	UIButton *loginBtn = [[UIButton alloc] init];
	loginBtn.frame = CGRectMake(SCREEN_WIDTH/2-lbw/2, gaph1+fh*2+gaph2, lbw, lbh);
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_N] forState:UIControlStateNormal];
	[loginBtn setBackgroundImage:[UIImage imageNamed:PIC_LOGIN_BTN_H] forState:UIControlStateHighlighted];
	[loginBtn setTintColor:[UIColor redColor]];
	[loginBtn setTitle:NSLocalizedString(@"login", @"login") forState:UIControlStateNormal];
	[loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
	[loginBtn addTarget:self action:@selector(onClickLogin:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:loginBtn];
	
    CGFloat gaph3 = 75.0;
    CGFloat wqbw = 44.0;
    CGFloat wqbh = 44.0;
	CGFloat wqlw = 103.0;
	UIButton *weiboBtn = [[UIButton alloc] init];
	weiboBtn.frame = CGRectMake(SCREEN_WIDTH/2-wqlw/2, gaph1+fh*2+gaph2+lbh+gaph3, wqbw, wqbh);
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_N] forState:UIControlStateNormal];
	[weiboBtn setBackgroundImage:[UIImage imageNamed:PIC_WEIBO_BTN_H] forState:UIControlStateHighlighted];
    [weiboBtn addTarget:self action:@selector(onClickSinaLoginButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:weiboBtn];
	
	UIButton *qqBtn = [[UIButton alloc] init];
	qqBtn.frame = CGRectMake(SCREEN_WIDTH-(SCREEN_WIDTH-wqlw)/2-wqbw, gaph1+fh*2+gaph2+lbh+gaph3, wqbw, wqbh);
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_N] forState:UIControlStateNormal];
	[qqBtn setBackgroundImage:[UIImage imageNamed:PIC_QQ_BTN_H] forState:UIControlStateHighlighted|UIControlStateSelected];
    [qqBtn addTarget:self action:@selector(onClickQQLoginButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:qqBtn];
    
	UIButton *forgetPWBtn = [[UIButton alloc] init];
	forgetPWBtn.frame = CGRectMake(SCREEN_WIDTH/2-60/2, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_H-60, 60, 60);
	forgetPWBtn.showsTouchWhenHighlighted = YES;
	[forgetPWBtn setTitle:NSLocalizedString(@"forget password", @"forget password") forState:UIControlStateNormal];
	[forgetPWBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	forgetPWBtn.titleLabel.font = [UIFont systemFontOfSize:13];
	[forgetPWBtn addTarget:self action:@selector(clickForgetPWButton:) forControlEvents:UIControlEventTouchUpInside];
	[containerScrollView addSubview:forgetPWBtn];
	
		// login notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenSinaAuthSuccess:) name:NOTI_SINA_AUTH_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenLoginSuccess:) name:NOTI_QQ_AUTH_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenLoginSuccess:) name:NOTI_WY_LOGIN_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenLoginSuccess:) name:NOTI_WY_REG_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenLoginSuccess:) name:NOTI_WY_RESET_PWD_OK object:nil];
}


- (void)backToSetting:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registerUser:(id)sender {
    WYRegisterController *rc = [[WYRegisterController alloc] init];
    [self.navigationController pushViewController:rc animated:YES];
}

#pragma mark - NOTI
- (void)doWhenSinaAuthSuccess:(id)sender {
    //fetch user info from sina.
    NSString *userInfoBaseStr = @"https://api.weibo.com/2/users/show.json";
    NSString *token = [[[WYGlobalState sharedGlobalState] sinaUserInfo] authToken];
    NSString *uid = [[[WYGlobalState sharedGlobalState] sinaUserInfo] userID];
    NSString *urlStr = [NSString stringWithFormat:@"%@?uid=%@&access_token=%@", userInfoBaseStr, uid, token];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.tag = 2;
    [request setDelegate:self];
    [request setRequestMethod:@"GET"];
    [request startAsynchronous];

}

- (void)doWhenQQAuthSuccess:(id)sender {
    //fetch user info from qq.
    
//    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
//	[infoDic setObject:@"qq" forKey:JSON_BODY_KEY_LOGINFROM];/*must be "qq"*/
//	[infoDic setObject:[[[WYGlobalState sharedGlobalState] sinaUserInfo] userID] forKey:JSON_BODY_KEY_UID3RD];
//	
//	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getThirdPartLoginCallBackURL]];
//	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"third_data"];
//	request.delegate = self;
//	[request startAsynchronous];
}

- (void)doWhenLoginSuccess:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma UIButton Event
- (void)onClickSinaLoginButton:(id)sender {
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = SinaRedirectUrl;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}

- (void)onClickQQLoginButton:(id)sender {
    self.tcOAuth = [[TencentOAuth alloc] initWithAppId:QQAppID andDelegate:self];
    NSArray *permissions = [[NSArray alloc] initWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_ADD_ALBUM,
                            kOPEN_PERMISSION_ADD_IDOL,
                            kOPEN_PERMISSION_ADD_ONE_BLOG,
                            kOPEN_PERMISSION_ADD_PIC_T,
                            kOPEN_PERMISSION_ADD_SHARE,
                            kOPEN_PERMISSION_ADD_TOPIC,
                            kOPEN_PERMISSION_CHECK_PAGE_FANS,
                            kOPEN_PERMISSION_DEL_IDOL,
                            kOPEN_PERMISSION_DEL_T,
                            kOPEN_PERMISSION_GET_FANSLIST,
                            kOPEN_PERMISSION_GET_IDOLLIST,
                            kOPEN_PERMISSION_GET_INFO,
                            kOPEN_PERMISSION_GET_OTHER_INFO,
                            kOPEN_PERMISSION_GET_REPOST_LIST,
                            kOPEN_PERMISSION_LIST_ALBUM,
                            kOPEN_PERMISSION_UPLOAD_PIC,
                            kOPEN_PERMISSION_GET_VIP_INFO,
                            kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                            kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                            kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                            nil];
    
    [_tcOAuth authorize:permissions inSafari:NO];
}

- (void)onClickLogin:(id)sender {

	if (_userField.text == nil || [_userField.text length]==0 || _passwdField.text == nil || [_passwdField.text length]==0) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"please input both username & password" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
		return;
	}
	
	NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
	[infoDic setObject:_userField.text forKey:JSON_BODY_KEY_TEL];
	[infoDic setObject:_passwdField.text forKey:JSON_BODY_KEY_PWD];
	
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getWYLoginURL]];
    request.tag = 1;
	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"logindata"];
	request.delegate = self;
	[request startAsynchronous];
	
}

- (void)clickCancelButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickRegisterButton:(id)sender {
	WYRegisterController *rc = [[WYRegisterController alloc] init];
	[self.navigationController pushViewController:rc animated:YES];
}

- (void)clickForgetPWButton:(id)sender {
    WYResetPasswordController *rpv = [[WYResetPasswordController alloc] init];
    [self.navigationController pushViewController:rpv animated:YES];
}


//===
#pragma mark - Tencent Session Delegate
- (void)tencentDidLogin {
    LOGFUNCTION;
	if (_tcOAuth.accessToken != nil && 0 != [_tcOAuth.accessToken length]) {
		[[[WYGlobalState sharedGlobalState] qqUserInfo] setAuthToken:_tcOAuth.accessToken];
		[[[WYGlobalState sharedGlobalState] qqUserInfo] setOpenID:_tcOAuth.openId];
		[[[WYGlobalState sharedGlobalState] qqUserInfo] setExpirationDate:_tcOAuth.expirationDate];
		[_tcOAuth performSelectorOnMainThread:@selector(getUserInfo) withObject:nil waitUntilDone:YES];
    } else {
		UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"It's must be Tencent's Fault!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
    }

}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"QQ登录失败" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertview show];
}

- (void)tencentDidNotNetWork {
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"QQ登录，没有网络！" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertview show];
}

- (void)getUserInfoResponse:(APIResponse *)response {
    LOGFUNCTION;
	mlog(@"QQ getUserInfo response : \n%@", [response.jsonResponse description]);
	[[[WYGlobalState sharedGlobalState] qqUserInfo] setUserName:[response.jsonResponse objectForKey:@"nickname"]];
	[[[WYGlobalState sharedGlobalState] qqUserInfo] setUserImageUrl:[response.jsonResponse objectForKey:@"figureurl_1"]];
	
    //Callback
    
    
	[[NSNotificationCenter defaultCenter] postNotificationName:NOTI_QQ_LOGIN_OK object:nil userInfo:nil];
}

- (void)tencentOAuth:(TencentOAuth *)tencentOAuth doCloseViewController:(UIViewController *)viewController {
    LOGFUNCTION;
}


//===
#pragma mark - ASIHttpRequest

- (void)requestFinished:(ASIHTTPRequest *)request {
	NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
	mlog(@"== WY Login Response tag :%i, info dic : \n%@", request.tag, [infoDic description]);
	
    if (request.tag == 1/*WY*/) {
        
        NSNumber *state = [infoDic objectForKey:JSON_RES_KEY_ST];
        if ([state intValue] == 0) {
            [[[WYGlobalState sharedGlobalState] wyUserInfo] setAuthToken:[infoDic objectForKey:JSON_RES_KEY_UT]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_WY_LOGIN_OK object:nil userInfo:nil];
        } else {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:[infoDic objectForKey:JSON_RES_KEY_MSG] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
            [alertview show];
        }
        
    } else if (request.tag == 2/*SINA*/) {
        mlog(@"== SINA Request User Info");
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
        NSString *userName = [jsonDic objectForKey:@"name"];
        [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserName:userName];
        NSString *imgUrl = [jsonDic objectForKey:@"profile_image_url"];
        [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserImageUrl:imgUrl];
        
        // call back
        NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
        [infoDic setObject:@"weibo" forKey:JSON_BODY_KEY_LOGINFROM];/*must be "weibo"*/
        [infoDic setObject:[[[WYGlobalState sharedGlobalState] sinaUserInfo] userID] forKey:JSON_BODY_KEY_UID3RD];
        [infoDic setObject:userName forKey:JSON_BODY_KEY_NICKNAME];
        
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getThirdPartLoginCallBackURL]];
        request.tag = 3;
        [request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"third_data"];
        request.delegate = self;
        [request startAsynchronous];
        
    } else if (request.tag == 3/*SINA CALLBACK*/) {
        
        NSNumber *state = [infoDic objectForKey:JSON_RES_KEY_ST];
        if ([state intValue] == 0) {
            mlog(@"== Callback state is 0");
            [[[WYGlobalState sharedGlobalState] sinaUserInfo] setWyToken:[infoDic objectForKey:JSON_RES_KEY_UT]];
            [self performSelectorOnMainThread:@selector(doWhenLoginSuccess:) withObject:nil waitUntilDone:NO];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_WY_LOGIN_OK object:nil userInfo:nil];
        } else {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:[infoDic objectForKey:JSON_RES_KEY_MSG] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
            [alertview show];
        }
        
    } else if (request.tag == 4/*QQ*/) {
        
        //call back
        
    } else if (request.tag == 5/*QQ CALLBACK*/) {
        
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


#pragma UITextField Delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
	[textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - UIGesture
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    return YES;
}

#pragma -
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
