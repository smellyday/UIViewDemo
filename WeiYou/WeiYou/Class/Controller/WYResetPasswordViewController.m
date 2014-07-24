//
//  WYResetPasswordViewController.m
//  WeiYou
//
//  Created by owen on 7/24/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYResetPasswordViewController.h"
#import "consts.h"

@interface WYResetPasswordViewController ()

@end

@implementation WYResetPasswordViewController


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
	
	UILabel *resetPWTitle = [[UILabel alloc] init];
	resetPWTitle.frame = NAV_BAR_TITLE_FRAME;
	[resetPWTitle setText:NSLocalizedString(@"reset password", @"reset password")];
	[resetPWTitle setTextAlignment:NSTextAlignmentCenter];
	[resetPWTitle setTextColor:[UIColor whiteColor]];
	resetPWTitle.font = [UIFont systemFontOfSize:19];
	
	UIView *topBarContainer = [[UIView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H, self.view.frame.size.width, NAV_BAR_H)];
	topBarContainer.backgroundColor = [UIColor clearColor];
	[topBarContainer addSubview:cancelBtn];
	[topBarContainer addSubview:resetPWTitle];
	[self.view addSubview:topBarContainer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
