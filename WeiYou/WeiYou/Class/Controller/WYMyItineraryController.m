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
#import "WYDataEngine.h"
#import "WYMTrip.h"
#import "consts.h"
#import "WYNewItineraryController.h"

@interface WYMyItineraryController ()

@end

@implementation WYMyItineraryController
@synthesize mTableView = _mTableView;
@synthesize trips = _trips;

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
    self.trips = [[WYDataEngine sharedDataEngine] trips];
	
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

//    WYNewItineraryController *newitn = [[WYNewItineraryController alloc] init];
//    
//	UINavigationController *ricnav = [[UINavigationController alloc] initWithRootViewController:ric];
//	[ricnav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];

}

#pragma notification received

- (void)doWhenCoreDataChanged:(NSNotification *)notification {
    
}

- (void)doWhenBiSynFinish:(NSNotification *)notification {
    self.trips = [[WYDataEngine sharedDataEngine] trips];
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
	return [_trips count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *NORMALCELL = @"NCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
	
	NSInteger row = [indexPath row];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
	}
    WYMTrip *mTrip = (WYMTrip *)[_trips objectAtIndex:row];
    cell.textLabel.text = mTrip.tripName;
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	WYTripController *theTripController = [[WYTripController alloc] init];
    theTripController.trip = [_trips objectAtIndex:[indexPath row]];
    
		//    NSOperationQueue *mq = [[NSOperationQueue alloc] init];
		//    [mq setMaxConcurrentOperationCount:2];
		//    WYUploadTripOperation *op = [[WYUploadTripOperation alloc] init];
		//    op.sym = 1;
		//    [mq addOperation:op];
		//
		//    WYUploadTripOperation *op2 = [[WYUploadTripOperation alloc] init];
		//    op2.sym = 2;
		//    [mq addOperation:op2];
	
	[self.navigationController pushViewController:theTripController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

#pragma system
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
