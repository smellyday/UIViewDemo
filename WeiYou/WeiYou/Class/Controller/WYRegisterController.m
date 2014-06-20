//
//  WYRegisterController.m
//  WeiYou
//
//  Created by zhangpan on 14-6-20.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYRegisterController.h"

@interface WYRegisterController ()

@end

@implementation WYRegisterController

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
