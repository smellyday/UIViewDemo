//
//  WYNewItineraryController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-7.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYNewItineraryController.h"
#import "consts.h"

@interface WYNewItineraryController ()

@end

@implementation WYNewItineraryController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIBarButtonItem *mCancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onClickCancel:)];
	mCancelBtn.tintColor = [UIColor whiteColor];
	self.navigationItem.leftBarButtonItem = mCancelBtn;
	
	// main content.
	
	
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
