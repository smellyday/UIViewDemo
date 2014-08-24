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
#import "TPGestureTableViewCell.h"

@interface WYMyItineraryController ()


@end

@implementation WYMyItineraryController
@synthesize mTableView = _mTableView;
@synthesize userTripAgent = _userTripAgent;
@synthesize registerCellSet = _registerCellSet;
@synthesize manipulatingCell = _manipulatingCell;

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
	self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.backgroundColor = [UIColor whiteColor];
	self.mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_mTableView];
	
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenBiSynFinish:) name:NOTI_TRIPS_SYNC_FINISH object:nil];
	
	_registerCellSet = [NSMutableSet setWithCapacity:2];
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
    /*
	WYTripCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
	
	NSInteger row = [indexPath row];
	if (cell == nil) {
		cell = [[WYTripCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
	}
    */
    
    WYMTrip *mTrip = [_userTripAgent objectInUserTripsAtIndex:[indexPath row]];
    WYTripCell *cell = [[WYTripCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NORMALCELL];
	cell.indexPath = indexPath;
	cell.delegate = self;
    cell.citiesNameLabel.text = mTrip.tripName;
	cell.highlighted = NO;
	
	return cell;
}

#pragma mark - UITableViewDelegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (_registerCellSet && [_registerCellSet count]>0) {
		return nil;
	}
	
	return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	mlog(@"%s", __func__);
    
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

#pragma mark - TripCellDelegate
- (void)cellStateChanged:(WYTripCell *)cell {
	
	if (cell.cellSt != tripCellStateNormal) {
		if ([_registerCellSet containsObject:cell]) {
			[_registerCellSet removeObject:cell];
		}
		[_registerCellSet addObject:cell];
	}
	
	if (cell.cellSt == tripCellStateNormal) {
		[self recoverTableViewToNormal];
	}
	
	if (_registerCellSet && [_registerCellSet count]>0) {
		_mTableView.scrollEnabled = NO;
	} else {
		_mTableView.scrollEnabled = YES;
	}
}

- (TripCellStatus)getTableViewState {
	
	if (_registerCellSet && [_registerCellSet count] > 0) {
		return tripCellStateExpanded;
	}
	
	return tripCellStateNormal;
	
}

- (void)recoverTableViewToNormal {
	
	if (_registerCellSet && [_registerCellSet count]>0) {
//		NSMutableSet *expandedCellSet = [NSMutableSet setWithCapacity:1];
//		
//		for (WYTripCell *cell in _registerCellSet.allObjects) {
//			if (cell.cellSt == tripCellStateExpanded) {
//				[expandedCellSet addObject:cell];
//			}
//		}
//		[expandedCellSet makeObjectsPerformSelector:@selector(backToNormalState)];
//		
//		for (id cell in expandedCellSet.allObjects) {
//			[_registerCellSet removeObject:cell];
//		}
		
		[_registerCellSet makeObjectsPerformSelector:@selector(backToNormalState)];
		[_registerCellSet removeAllObjects];
		
	}
	
	if (![_registerCellSet count]>0) {
		_mTableView.scrollEnabled = YES;
	}
}


- (void)deleteCell:(WYTripCell *)cell {
	self.manipulatingCell = cell;
	
	UIAlertView *delAlert = [[UIAlertView alloc] initWithTitle:nil
													   message:@"确认删除此行程？"
													  delegate:self
											 cancelButtonTitle:@"Cancel"
											 otherButtonTitles:@"OK", nil];
	delAlert.tag = 1;
	[delAlert show];

}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.tag == 1) {
			/* Delete Trip Cell Alert */
		if (buttonIndex == 0/*cancel*/) {
				//do nothing.
		} else if (buttonIndex == 1) {
				//delete the trip cell.
			[[[WYDataEngine sharedDataEngine] userTripAgent] removeObjectFromUserTripsAtIndex:_manipulatingCell.indexPath.row];
			[self recoverTableViewToNormal];
		}
	}
}

















@end
