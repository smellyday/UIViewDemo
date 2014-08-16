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
#import "WYCitiesController.h"
#import "WYMTrip.h"
#import "WYSysDestinations.h"
#import "WYNationButton.h"

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
	WYSysDestinations *destinationAgent = [[WYDataEngine sharedDataEngine] sysDestinationAgent];
    NSArray *allSysContinents = [destinationAgent getSysAllContinents];
	WYMTrip *creatingTrip = [[WYDataEngine sharedDataEngine] creatingTrip];
    NSArray *allUserNations = [creatingTrip.userDestinationAgent getUserAllNations];
    
    // main content.
    CGFloat contiH = 176.0;
    
    UIScrollView *scrollContainer = [[UIScrollView alloc] init];
    scrollContainer.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_BTN_H);
    scrollContainer.backgroundColor = [UIColor whiteColor];
    scrollContainer.delaysContentTouches = YES;
    scrollContainer.scrollEnabled = YES;
    scrollContainer.contentSize = CGSizeMake(SCREEN_WIDTH, contiH*7);
    [self.view addSubview:scrollContainer];
    
    for (int i = 0; i < [allSysContinents count]; i++) {
        UIView *contiView = [[UIView alloc] initWithFrame:CGRectMake(0, contiH*i, SCREEN_WIDTH, contiH)];
        [scrollContainer addSubview:contiView];
        
        WYSysContinent *continent = [allSysContinents objectAtIndex:i];
        UILabel *continentTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        continentTitle.font = [UIFont systemFontOfSize:17];
        continentTitle.textAlignment = NSTextAlignmentCenter;
        [continentTitle setText:continent.nodeName];
        [continentTitle setTextColor:COLOR_ON_PLACE_N];
        [contiView addSubview:continentTitle];
        
        NSArray *nationArr = continent.childArray;
        NSInteger cntyCount = MIN([nationArr count], 12);
        for (int ci = 0; ci < cntyCount; ci++) {
            if (ci == 11) {
                WYNationButton *nb = [[WYNationButton alloc] initButtonWithNation:nil atIndex:ci];
                [contiView addSubview:nb];
            } else {
                WYSysNation *sysNation = [nationArr objectAtIndex:ci];
                WYNationButton *nb = [[WYNationButton alloc] initButtonWithNation:sysNation atIndex:ci];
                [nb addTarget:self action:@selector(onClickCountryBtn:) forControlEvents:UIControlEventTouchUpInside];
                [contiView addSubview:nb];
                
                for (WYUserNation *userNation in allUserNations) {
                    if (userNation.corSysNation.mID == sysNation.mID) {
                        nb.selected = YES;
                    } else {
                        nb.selected = NO;
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
    if ([sender isKindOfClass:[WYNationButton class]]) {
        WYCitiesController *citiesc = [[WYCitiesController alloc] init];
        citiesc.nationButton = (WYNationButton *)sender;
        [self.navigationController pushViewController:citiesc animated:YES];
    }
}







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
