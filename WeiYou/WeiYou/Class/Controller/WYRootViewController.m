//
//  WYRootViewController.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYRootViewController.h"
#import "WYSettingsViewController.h"
#import "WYCoverTableViewCell.h"
#import "WYCreateNewViewController.h"
#import "WYCMTrip.h"
#import "WYFileManager.h"
#import "WYCoreDataEngine.h"
#import "WYTripController.h"
#import "consts.h"

@interface WYRootViewController ()

@end

@implementation WYRootViewController
@synthesize mTableView = _mTableView;
@synthesize tripsArray = _tripsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

//    if ([[WYCoreDataEngine sharedCoreDataEngine] dataOK]) {
//        self.tripsArray = [[WYCoreDataEngine sharedCoreDataEngine] tripsArray];
//    } else {
//        mlog(@"trips data is not ok.");
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenTripsDataOK:) name:WY_TRIPS_DATA_OK object:nil];
    
	// Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.title = @"微游";
	
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(clickSettings:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
	UIBarButtonItem *mRightButton = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(clickCreateNew:)];
	self.navigationItem.rightBarButtonItem = mRightButton;
	
		//add table view
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.mTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
	
	[self.view addSubview:_mTableView];
	
		// ----- prepare data -----
    if ([[WYCoreDataEngine sharedCoreDataEngine] dataOK]) {
        self.tripsArray = [[WYCoreDataEngine sharedCoreDataEngine] tripsArray];
    } else {
        mlog(@"trips data is not ok.");
    }
	
}

- (void)clickSettings:(id)sender {
	WYSettingsViewController *mSettingsController = [[WYSettingsViewController alloc] init];
	UINavigationController *mNavController = [[UINavigationController alloc] initWithRootViewController:mSettingsController];
	mNavController.navigationBar.hidden = YES;
	mNavController.navigationBar.barTintColor = WY_MAIN_COLOR;
	mNavController.navigationBar.tintColor = [UIColor blackColor];
	
	[self presentViewController:mNavController animated:YES completion:nil];
}

- (void)clickCreateNew:(id)sender {
//	WYFileManager *mf = [[WYFileManager alloc] init];
//	[mf findAllFiles:@"/var/mobile/Applications/B3A77942-A577-4D35-A979-5F020CD60B90" withLevel:0];
	
	WYCreateNewViewController *mCreateNewController = [[WYCreateNewViewController alloc] init];
	[self presentViewController:mCreateNewController animated:YES completion:nil];
}

#pragma notification received
- (void)doWhenTripsDataOK:(NSNotification *)notification {
    if ([[WYCoreDataEngine sharedCoreDataEngine] dataOK]) {
        self.tripsArray = [[WYCoreDataEngine sharedCoreDataEngine] tripsArray];
        [self.mTableView reloadData];
        mlog(@"receive notification -- trips data is ok now.");
    } else {
        mlog(@"receive notification -- trips data is still not ok.");
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_tripsArray count];
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *NORMALCELL = @"Cell";
	WYCoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
	
	NSInteger row = [indexPath row];
	if (cell == nil) {
		WYCMTrip *model = (WYCMTrip *)[_tripsArray objectAtIndex:row];
		cell = [[WYCoverTableViewCell alloc] initWithXCModel:model reuseIdentifier:NORMALCELL];
		
		return cell;
	}
	
	WYCMTrip *model2 = (WYCMTrip *)[_tripsArray objectAtIndex:row];
	cell.xcMainImageView.image = [UIImage imageWithData:model2.tripMainImageData];
	cell.xcNameLabel.text = model2.tripName;
	cell.xcDesLabel.text = model2.tripDescription;
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	WYTripController *theTripController = [[WYTripController alloc] init];
    WYCMTrip *trip = (WYCMTrip *)[_tripsArray objectAtIndex:[indexPath row]];
    
	theTripController.trip = trip;
	[self.navigationController pushViewController:theTripController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

	// =======
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
