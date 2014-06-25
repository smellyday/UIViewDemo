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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor]; // can not be clearColor
    
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
