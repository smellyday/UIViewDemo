//
//  WYUserGuideViewController.m
//  WeiYou
//
//  Created by owen on 11/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYUserGuideViewController.h"
#import "consts.h"

@interface WYUserGuideViewController ()

@end

@implementation WYUserGuideViewController

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
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.navigationController.navigationBar.hidden = NO;
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack:)];
	
}

- (void)clickBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
	self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
