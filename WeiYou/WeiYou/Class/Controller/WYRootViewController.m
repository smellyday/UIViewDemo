//
//  WYRootViewController.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYRootViewController.h"
#import "WYSettingsViewController.h"
#import "WYCreateNewViewController.h"
#import "WYTripController.h"
#import "WYDataEngine.h"
#import "WYMTrip.h"
#import "consts.h"

@interface WYRootViewController ()

//- (void)refresh;

@end

@implementation WYRootViewController
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenBiSynFinish:) name:WY_NOTI_TRIPS_SYNC_FINISH object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenCoreDataChanged:) name:NSManagedObjectContextObjectsDidChangeNotification object:[[WYCoreDataEngine sharedCoreDataEngine] context]];
    self.trips = [[WYDataEngine sharedDataEngine] trips];
    mlog(@"trips count is %@", [_trips description]);
	
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.title = @"FreeTravel";
	
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStylePlain target:self action:@selector(clickSettings:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
	UIBarButtonItem *mRightButton = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(clickCreateNew:)];
	self.navigationItem.rightBarButtonItem = mRightButton;
	
		//add table view
	self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.backgroundColor = [UIColor whiteColor];
	[self.mTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[self.view addSubview:_mTableView];
	
}

- (void)clickSettings:(id)sender {

	WYSettingsViewController *mSettingsController = [[WYSettingsViewController alloc] init];
    [self.navigationController pushViewController:mSettingsController animated:YES];

}

- (void)clickCreateNew:(id)sender {
	
    /*
	NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WYCMTrip"];
	NSSortDescriptor *sortDes = [NSSortDescriptor sortDescriptorWithKey:@"tripIndex" ascending:YES];
	request.sortDescriptors = [NSArray arrayWithObject:sortDes];
	NSError *merr;
	NSArray *trips = [[[WYCoreDataEngine sharedCoreDataEngine] context] executeFetchRequest:request error:&merr];
	for (WYCMTrip *t in trips) {
		mlog(@"%@", [t description]);
	}
     */
	
	/*
	WYCreateNewViewController *mCreateNewController = [[WYCreateNewViewController alloc] init];
	[self presentViewController:mCreateNewController animated:YES completion:nil];
	*/
}

#pragma notification received

- (void)doWhenCoreDataChanged:(NSNotification *)notification {
    
}

- (void)doWhenBiSynFinish:(NSNotification *)notification {
    self.trips = [[WYDataEngine sharedDataEngine] trips];
    [self.mTableView reloadData];
    
    [[WYDataEngine sharedDataEngine] saveTrips];
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
