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
#import "WYCountryButton.h"
#import "WYMTrip.h"
#import "WYMUserContinent.h"
#import "WYMUserCountry.h"
#import "WYMUserCity.h"
#import "WYMTrip.h"

@interface WYCitiesController ()

@end

@implementation WYCitiesController
@synthesize countryBtn = _countryBtn;


- (void)viewDidLoad
{
    MLOGFUNCTION;
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
    NSArray *allCities = [_countryBtn.sysCountry allCities];
    NSArray *allUserChsCities = [[[WYDataEngine sharedDataEngine] creatingTrip] getAllChosenCities];
    
    // main content
    CGFloat gapTopH = 35.0;
    CGFloat gapMidH = 13.0+22.0;
    int rowCount = (int)[allCities count]/3+1;
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
    [countryTitle setText:_countryBtn.sysCountry.name];
    [countryTitle setTextColor:COLOR_ON_PLACE_N];
    [scrollContainer addSubview:countryTitle];
    
    for (int i = 0; i < [allCities count]; i++) {
        WYMCity *sysCity = [allCities objectAtIndex:i];
        WYCityButton *pb = [[WYCityButton alloc] initButtonWithCity:sysCity atIndex:i];
        pb.selected = NO;
        [pb addTarget:self action:@selector(onClickCityButton:) forControlEvents:UIControlEventTouchUpInside];
        [scrollContainer addSubview:pb];
        
        for (WYMUserCity *chscity in allUserChsCities) {
            if (sysCity.ID == chscity.ID) {
                pb.selected = YES;
                pb.userCity = chscity;
            }
        }
    }
    
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onClickOK:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)onClickCityButton:(id)sender {
    if ([sender isKindOfClass:[WYCityButton class]]) {
        WYCityButton *cityBtn = (WYCityButton *)sender;
        WYMTrip *creatingTrip = [[WYDataEngine sharedDataEngine] creatingTrip];
        
        if (cityBtn.selected == YES) {
            cityBtn.selected = NO;
            if ([cityBtn.userCity.countryOfUser.chosenCities count] == 1) {
                _countryBtn.selected = NO;
            }
            [creatingTrip unchooseCity:cityBtn.userCity];
            cityBtn.userCity = nil;
        } else {
            cityBtn.selected = YES;
            _countryBtn.selected = YES;
            cityBtn.userCity = [[WYMUserCity alloc] initWithSystemCity:cityBtn.sysCity];
            [creatingTrip chooseCity:cityBtn.userCity];
        }
        
        MLOG_USER_CHOSEN_PLACE_INFO;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
