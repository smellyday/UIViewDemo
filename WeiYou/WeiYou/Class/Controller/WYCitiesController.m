//
//  WYCitiesController.m
//  WeiYou
//
//  Created by zhangpan on 14-8-13.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYCitiesController.h"
#import "consts.h"
#import "WYDataEngine.h"
#import "WYMTrip.h"
#import "WYShiButton.h"

@interface WYCitiesController ()

@end

@implementation WYCitiesController
@synthesize nationButton = _nationButton;


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
	WYSysDestinations *sysDestinationAgent = [[WYDataEngine sharedDataEngine] sysDestinationAgent];
	NSArray *allSysCities = [sysDestinationAgent getSysCitiesInNation:_nationButton.sysNation];
	WYMTrip *creatingTrip = [[WYDataEngine sharedDataEngine] creatingTrip];
	NSArray *allUserCities = [creatingTrip.userDestinationAgent getUserAllCities];
    
    // main content
    CGFloat gapTopH = 35.0;
    CGFloat gapMidH = 13.0+22.0;
    int rowCount = (int)[allSysCities count]/3+1;
    if ([allSysCities count]%3 != 0) {
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
    [countryTitle setText:_nationButton.sysNation.nodeName];
    [countryTitle setTextColor:COLOR_ON_PLACE_N];
    [scrollContainer addSubview:countryTitle];
    
    for (int i = 0; i < [allSysCities count]; i++) {
        WYSysCity *sysCity = [allSysCities objectAtIndex:i];
        WYShiButton *pb = [[WYShiButton alloc] initButtonWithCity:sysCity atIndex:i];
        pb.selected = NO;
		pb.userCity = nil;
        [pb addTarget:self action:@selector(onClickCityButton:) forControlEvents:UIControlEventTouchUpInside];
        [scrollContainer addSubview:pb];
        
        for (WYUserCity *chscity in allUserCities) {
            if (sysCity.mID == chscity.corSysCity.mID) {
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
    if ([sender isKindOfClass:[WYShiButton class]]) {
        WYShiButton *cityBtn = (WYShiButton *)sender;
        WYMTrip *creatingTrip = [[WYDataEngine sharedDataEngine] creatingTrip];
		WYUserNation *uNation = cityBtn.userCity.pUserNode;
		
		mlog(@"CityButton INFO : %@", cityBtn.sysCity.nodeName);
        
        if (cityBtn.selected == YES) {
			
            cityBtn.selected = NO;
			
			WYUserCity *userNode = cityBtn.userCity;
            [creatingTrip.userDestinationAgent delUserNode:&userNode];
            cityBtn.userCity = nil;
			
			NSArray *allUserNations = [creatingTrip.userDestinationAgent getUserAllNations];
			if ([allUserNations containsObject:uNation]) {
				_nationButton.selected = YES;
			} else {
				_nationButton.selected = NO;
			}
			
        } else {
			
            cityBtn.selected = YES;
            _nationButton.selected = YES;
			
			WYUserCity *uCity = [[WYUserCity alloc] initWithSysCity:cityBtn.sysCity];
            [creatingTrip.userDestinationAgent addCity:&uCity];
			cityBtn.userCity = uCity;
        }
        
		NSArray *contiArr = [creatingTrip.userDestinationAgent getUserAllContinents];
		for (WYUserContinent *continent in contiArr) {
			mlog(@"Continent : %@ and info : %@", continent.corSysContinent.nodeName, [continent description]);
			
			NSArray *nationArr = [creatingTrip.userDestinationAgent getUserNationsInContinent:continent];
			mlog(@"nation count : %d", [nationArr count]);
			for (WYUserNation *nation in nationArr) {
				mlog(@"== Nation : %@ and info : %@", nation.corSysNation.nodeName, [nation description]);
				
				NSArray *cityArr = [creatingTrip.userDestinationAgent getUserCitiesInNation:nation];
				mlog(@"city count : %d", [cityArr count]);
				for (WYUserCity *city in cityArr) {
					mlog(@"== == City : %@ and info : %@", city.corSysCity.nodeName, [city description]);
				}
			}
		}
		mlog(@"=================================================");
		
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
