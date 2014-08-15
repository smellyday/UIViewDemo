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
#import "WYCountryButton.h"
#import "WYMContinent.h"
#import "WYCitiesController.h"
#import "WYMTrip.h"
#import "WYMUserCountry.h"
#import "WYMUserContinent.h"

@interface WYCountriesController ()

@end

@implementation WYCountriesController

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
    NSArray *allContinents = [[WYDataEngine sharedDataEngine] allContinents];
    NSArray *allUserChsCountries = [[[WYDataEngine sharedDataEngine] creatingTrip] getAllChosenCountries];
    
    // main content.
    CGFloat contiH = 176.0;
    
    UIScrollView *scrollContainer = [[UIScrollView alloc] init];
    scrollContainer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_BTN_H);
    scrollContainer.backgroundColor = [UIColor whiteColor];
    scrollContainer.delaysContentTouches = YES;
    scrollContainer.scrollEnabled = YES;
    scrollContainer.contentSize = CGSizeMake(SCREEN_WIDTH, contiH*7);
    [self.view addSubview:scrollContainer];
    
    for (int i = 0; i < [allContinents count]; i++) {
        UIView *contiView = [[UIView alloc] initWithFrame:CGRectMake(0, contiH*i, SCREEN_WIDTH, contiH)];
        [scrollContainer addSubview:contiView];
        
        WYMContinent *continent = [allContinents objectAtIndex:i];
        UILabel *continentTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        continentTitle.font = [UIFont systemFontOfSize:17];
        continentTitle.textAlignment = NSTextAlignmentCenter;
        [continentTitle setText:continent.name];
        [continentTitle setTextColor:COLOR_ON_PLACE_N];
        [contiView addSubview:continentTitle];
        
        NSArray *cntyArr = continent.allCountries;
        int cntyCount = MIN([cntyArr count], 12);
        for (int ci = 0; ci < cntyCount; ci++) {
            if (ci == 11) {
                WYCountryButton *cb = [[WYCountryButton alloc] initButtonWithCoutry:nil atIndex:ci];
                [contiView addSubview:cb];
            } else {
                WYMCountry *sysCountry = [cntyArr objectAtIndex:ci];
                WYCountryButton *cb = [[WYCountryButton alloc] initButtonWithCoutry:sysCountry atIndex:ci];
                [cb addTarget:self action:@selector(onClickCountryBtn:) forControlEvents:UIControlEventTouchUpInside];
                [contiView addSubview:cb];
                
                for (WYMUserCountry *muc in allUserChsCountries) {
                    if (muc.ID == sysCountry.ID) {
                        cb.selected = YES;
                    } else {
                        cb.selected = NO;
                    }
                }
            }
        }
        
        UIImageView *gapLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:PIC_ICON_DESTI_LINE]];
        gapLine.frame = CGRectMake(0, contiH-1, SCREEN_WIDTH, 1);
        [contiView addSubview:gapLine];
    }
    
}

#pragma mark - Click Event
- (void)onClickCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onClickOK:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)onClickCountryBtn:(id)sender {
    if ([sender isKindOfClass:[WYCountryButton class]]) {
        WYCitiesController *citiesc = [[WYCitiesController alloc] init];
        citiesc.countryBtn = (WYCountryButton *)sender;
        [self.navigationController pushViewController:citiesc animated:YES];
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
