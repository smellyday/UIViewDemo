//
//  WYCitiesController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCitiesController.h"
#import "consts.h"
#import "WYMCountry.h"
#import "WYMCity.h"
#import "WYMPlace.h"
#import "WYDataEngine.h"
#import "WYCityButton.h"
#import "WYMTrip.h"

@interface WYCitiesController ()

@end

@implementation WYCitiesController
@synthesize country = _country;


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
    NSArray *allCities = [_country allCities];
    
    // main content
    CGFloat gapTopH = 35.0;
    CGFloat gapMidH = 13.0+22.0;
    int rowCount = [allCities count]/3+1;
    if ([allCities count]%3 != 0) {
        rowCount++;
    }
    CGFloat scrollSizeH = gapTopH + gapMidH*rowCount;
    
    UIScrollView *scrollContainer = [[UIScrollView alloc] init];
    scrollContainer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_BTN_H);
    scrollContainer.delaysContentTouches = YES;
    scrollContainer.scrollEnabled = YES;
    scrollContainer.contentSize = CGSizeMake(SCREEN_WIDTH, MAX(scrollSizeH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_BTN_H));
    [self.view addSubview:scrollContainer];
    
    UILabel *countryTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    countryTitle.font = [UIFont systemFontOfSize:17];
    countryTitle.textAlignment = NSTextAlignmentCenter;
    [countryTitle setText:_country.name];
    [countryTitle setTextColor:COLOR_ON_PLACE_N];
    [scrollContainer addSubview:countryTitle];
    
    for (int i = 0; i < [allCities count]; i++) {
        WYCityButton *pb = [[WYCityButton alloc] initButtonWithCity:[allCities objectAtIndex:i] atIndex:i];
        [pb registerChooseCityFunction];
        [scrollContainer addSubview:pb];
    }
    
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
