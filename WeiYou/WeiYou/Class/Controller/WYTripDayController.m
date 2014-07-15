//
//  WYTripDayController.m
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayController.h"
#import "WYMSpot.h"
#import "consts.h"

@interface WYTripDayController ()

@end

@implementation WYTripDayController
@synthesize mTableView = _mTableView;
@synthesize tripName = _tripName;
@synthesize tripDay = _tripDay;
@synthesize spots = _spots;

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
	self.spots = [_tripDay spots];
    
    if (self.tripName != nil && ![self.tripName isEqualToString:@""]) {
        self.title = [NSString stringWithFormat:@"%@ : %@", self.tripName, self.tripDay.dayTHStr];
    } else {
        self.title = self.tripDay.dayTHStr;
    }
	
    self.navigationController.navigationBar.alpha = 1;
	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
	self.navigationItem.leftBarButtonItem = leftBarItem;
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
	self.navigationItem.rightBarButtonItem = rightBarItem;
    
    CGFloat mapviewOriginY = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
    CGFloat mapviewHeight = 150;
    UIView *mapView = [[UIView alloc] initWithFrame:CGRectMake(0, mapviewOriginY, self.view.frame.size.width, mapviewHeight)];
    mapView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:mapView];
	
    CGFloat tableviewOriginY = mapView.frame.origin.y + mapView.frame.size.height;
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableviewOriginY, self.view.frame.size.width, self.view.frame.size.height-tableviewOriginY) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.backgroundColor = [UIColor lightGrayColor];
    self.mTableView.alpha = 0.5;
	[self.mTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[self.view addSubview:_mTableView];
	
}

- (void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)edit:(id)sender {
    [_mTableView setEditing:!_mTableView.editing animated:YES];
    if (_mTableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"OK";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_spots count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *SPOTCELL = @"SpotCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SPOTCELL];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SPOTCELL];
	}
	
    WYMSpot *mSpot = [_spots objectAtIndex:[indexPath row]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@, %@", [mSpot spotName], [mSpot spotCountry], [mSpot spotInfo]];
    
	return cell;
	
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
/*
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger row = [indexPath row];
        WYCMSpot *spot = (WYCMSpot *)[self.spotsArray objectAtIndex:row];
        [[[WYCoreDataEngine sharedCoreDataEngine] context] deleteObject:spot];
        
        for (NSInteger i = row+1; i < [_spotsArray count]; i++) {
            WYCMSpot *spt = [_spotsArray objectAtIndex:i];
            spt.spotIndex = [NSNumber numberWithInt:(int)i-1];
        }
        [self.spotsArray removeObject:spot];
        [_mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_mTableView reloadData];
    }
 */
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    /*
    if (fromIndexPath.row != toIndexPath.row) {
        WYCMSpot *spot = (WYCMSpot *)[self.spotsArray objectAtIndex:fromIndexPath.row];
        [self.spotsArray removeObject:spot];
        [self.spotsArray insertObject:spot atIndex:toIndexPath.row];
        
        for (int i = 0; i < [_spotsArray count]; i++) {
            WYCMSpot *spt = (WYCMSpot *)[self.spotsArray objectAtIndex:i];
            spt.spotIndex = [NSNumber numberWithInt:i];
        }
        
        [_mTableView reloadData];
    }
     */
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
	v.backgroundColor = [UIColor grayColor];
	UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 20)];
	[v addSubview:l];
	if (section == 0) {
		l.text = @"Traffic";
	} else if (section == 1) {
		l.text = @"Spots";
	} else if (section == 2) {
		l.text = @"Hotel";
	} else {
		l.text = @"It's error man!";
	}
	
	return v;
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
