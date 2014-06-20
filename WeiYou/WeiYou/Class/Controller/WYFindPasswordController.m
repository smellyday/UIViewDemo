//
//  WYFindPasswordController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYFindPasswordController.h"

@interface WYFindPasswordController ()

@end

@implementation WYFindPasswordController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"找回密码";
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToLogin:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
    
    UITextField *mailField = [[UITextField alloc] initWithFrame:CGRectMake(35, 115, 250, 40)];
    mailField.borderStyle = UITextBorderStyleRoundedRect;
    mailField.placeholder = @"邮箱";
    [mailField becomeFirstResponder];
    [self.view addSubview:mailField];
    
    UIButton *resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    resetButton.frame = CGRectMake(35, 165, 250, 40);
    resetButton.backgroundColor = [UIColor greenColor];
    resetButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [resetButton setTitle:@"重置密码" forState:UIControlStateNormal];
    [resetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:resetButton];
}

- (void)backToLogin:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
