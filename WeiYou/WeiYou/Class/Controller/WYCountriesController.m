//
//  WYCountriesController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCountriesController.h"
#import "consts.h"
#import "WYDataEngine.h"

@interface WYCountriesController ()

@end

@implementation WYCountriesController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	
    // nav bar.
	UIBarButtonItem *mCancelBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_BACK_N]
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(onClickCancel:)];
	mCancelBtn.tintColor = [UIColor whiteColor];
	self.navigationItem.leftBarButtonItem = mCancelBtn;
	
	UIBarButtonItem *mOKBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_OK_N]
                                                               style:UIBarButtonItemStyleBordered
                                                              target:self
                                                              action:@selector(onClickOK:)];
	mOKBtn.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem = mOKBtn;
    
    // data
    [[WYDataEngine sharedDataEngine] allContinents];
    
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onClickOK:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
