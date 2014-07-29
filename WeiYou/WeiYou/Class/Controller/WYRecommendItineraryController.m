//
//  WYRecommendItineraryController.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYRecommendItineraryController.h"
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
	
	CGFloat bw = 44.0;
	CGFloat bh = 44.0;
	UIButton *settingBtn = [[UIButton alloc] init];
	settingBtn.frame = CGRectMake(0, 0, bw, bh);
	[settingBtn setBackgroundImage:[UIImage imageNamed:PIC_SETTING_N] forState:UIControlStateNormal];
	[self.navigationController.navigationBar addSubview:settingBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Click
- (void)onClickSetting:(id)sender {
	
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
