//
//  WYRecommendItineraryController.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYRecommendItineraryController.h"
#import "WYSettingsViewController.h"
#import "consts.h"

@interface WYRecommendItineraryController ()

@end

@implementation WYRecommendItineraryController

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
	self.view.backgroundColor = [UIColor redColor];
	
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_SETTING_N] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickSetting:)];
	mLeftButton.tintColor = [UIColor whiteColor];
	self.navigationItem.leftBarButtonItem = mLeftButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Click
- (void)onClickSetting:(id)sender {
	WYSettingsViewController *mSettingsController = [[WYSettingsViewController alloc] init];
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mSettingsController];
	[nav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
	[self.tabBarController presentViewController:nav animated:YES completion:nil];
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
