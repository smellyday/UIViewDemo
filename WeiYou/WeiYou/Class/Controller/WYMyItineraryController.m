//
//  WYMyItineraryController.m
//  WeiYou
//
//  Created by owen on 7/29/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//

#import "WYMyItineraryController.h"
#import "WYSettingsViewController.h"
#import "WYCreateNewViewController.h"
#import "WYTripController.h"
#import "WYMTrip.h"
#import "consts.h"
#import "WYNewItineraryController.h"

@interface WYMyItineraryController ()

@end

@implementation WYMyItineraryController
@synthesize mTableView = _mTableView;
@synthesize userTripAgent = _userTripAgent;

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
	self.view.backgroundColor = [UIColor whiteColor];
    self.userTripAgent = [[WYDataEngine sharedDataEngine] userTripAgent];
    [[[WYDataEngine sharedDataEngine] userTripAgent] addObserver:self forKeyPath:@"userTrips" options:NSKeyValueObservingOptionNew context:nil];
	
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_SETTING_N] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickSetting:)];
	mLeftButton.tintColor = [UIColor whiteColor];
	self.navigationItem.leftBarButtonItem = mLeftButton;
	
	UIBarButtonItem *mRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_ADD_NEW_TRIP] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickCreateNew:)];
	mRightButton.tintColor = [UIColor whiteColor];
	self.navigationItem.rightBarButtonItem = mRightButton;
	
	//add table view
	self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.mTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.mTableView.backgroundColor = [UIColor whiteColor];
	self.mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_mTableView];
	
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenBiSynFinish:) name:NOTI_TRIPS_SYNC_FINISH object:nil];
}

#pragma mark - Event Click
- (void)onClickSetting:(id)sender {
	WYSettingsViewController *mSettingsController = [[WYSettingsViewController alloc] init];
	[self.tabBarController.navigationController pushViewController:mSettingsController animated:YES];
}

- (void)onClickCreateNew:(id)sender {
    WYNewItineraryController *newitn = [[WYNewItineraryController alloc] init];
	UINavigationController *ricnav = [[UINavigationController alloc] initWithRootViewController:newitn];
	[ricnav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
	[self.tabBarController.navigationController presentViewController:ricnav animated:YES completion:nil];
}

#pragma notification received

- (void)doWhenCoreDataChanged:(NSNotification *)notification {
    
}

- (void)doWhenBiSynFinish:(NSNotification *)notification {
    [self.mTableView reloadData];
    
    [[WYDataEngine sharedDataEngine] saveTripsToLocal];
    [self.navigationController popToViewController:self animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_userTripAgent countOfUserTrips];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *NORMALCELL = @"NCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
	
	NSInteger row = [indexPath row];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
	}
    
    WYMTrip *mTrip = [_userTripAgent objectInUserTripsAtIndex:row];
    cell.textLabel.text = mTrip.tripName;
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
//	WYTripController *theTripController = [[WYTripController alloc] init];
//    theTripController.trip = [_trips objectAtIndex:[indexPath row]];
//	
//	[self.navigationController pushViewController:theTripController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

#pragma mark - system
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[[WYDataEngine sharedDataEngine] userTripAgent] removeObserver:self forKeyPath:@"userTrips"];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    mlog(@"%s", __func__);
    [_mTableView reloadData];
}

@end
