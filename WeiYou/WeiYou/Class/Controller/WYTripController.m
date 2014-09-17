//
//  WYTripController.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripController.h"
//#import "WYTripDayController.h"
#import "WYMTripDay.h"
#import "WYDataEngine.h"
#import "consts.h"
#import "WYFakeNavBar.h"



@interface WYTripController (private)

- (void)refresh;

@end

@implementation WYTripController
@synthesize mTableView = _mTableView;
@synthesize trip = _trip;

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.hidden = YES;
    
    // nav bar
	UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = NAV_BAR_LEFT_BTN_FRAME;
	[cancelBtn setBackgroundImage:[UIImage imageNamed:PIC_BACK_N] forState:UIControlStateNormal];
	[cancelBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];
    
    WYFakeNavBar *fakeNavBar = [[WYFakeNavBar alloc] init];
    fakeNavBar.titleLabel.text = self.trip.tripName;
    [fakeNavBar addSubview:cancelBtn];
	[self.view addSubview:fakeNavBar];
    
//    self.navigationController.navigationBar.alpha = 1;
//	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
//	self.navigationItem.leftBarButtonItem = leftBarItem;
//    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editDays:)];
//	self.navigationItem.rightBarButtonItem = rightBarItem;
    
//    CGFloat mapviewOriginY = self.navigationController.navigationBar.frame.origin.y + self.navigationController.navigationBar.frame.size.height;
//    CGFloat mapviewHeight = 150;
//    UIView *mapView = [[UIView alloc] initWithFrame:CGRectMake(0, mapviewOriginY, self.view.frame.size.width, mapviewHeight)];
//    mapView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:mapView];
	
//    CGFloat tableviewOriginY = mapView.frame.origin.y + mapView.frame.size.height;
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H+NAV_BAR_H, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_H) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.backgroundColor = [UIColor whiteColor];
	self.mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:_mTableView];
    
    //footer view
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
//    footerView.backgroundColor = [UIColor lightGrayColor];
    
//    UIButton *addOneDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    addOneDayButton.frame = CGRectMake(60, 10, 200, 80);
//    addOneDayButton.backgroundColor = [UIColor blueColor];
//    [addOneDayButton setTitle:@"增加一天" forState:UIControlStateNormal];
//    [addOneDayButton addTarget:self action:@selector(addOneDay:) forControlEvents:UIControlEventTouchUpInside];
//    [footerView addSubview:addOneDayButton];
    
//    self.mTableView.tableFooterView = footerView;
	
}


- (void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

/*
- (void)editDays:(id)sender {
    [_mTableView setEditing:!_mTableView.editing animated:YES];
    if (_mTableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"OK";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"Edit";
        [[WYDataEngine sharedDataEngine] saveTripsToLocal];
    }
	
}


- (void)addOneDay:(id)sender {
    
    NSDictionary *infoDic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:[_tripDays count]] forKey:WY_TRIPDAY_DAYTH];
    WYMTripDay *nTripDay = [[WYMTripDay alloc] initTripDayInfoDic:infoDic];
    [nTripDay updateDateInfoWithBeginDate:[_trip tripBeginDate]];
    
    [_tripDays addObject:nTripDay];
    [_mTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[_tripDays count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
}
*/

- (void)clickStuffList:(id)sender {
}

- (void)clickMap:(id)sender {
    /*
	WYMapViewController *mapViewController = [[WYMapViewController alloc] init];
	[self.navigationController pushViewController:mapViewController animated:YES];
     */
}

- (void)clickTraffic:(id)sender {
    /*
	NSMutableArray *allTrafficArr = [NSMutableArray arrayWithCapacity:10];
	for (WYMTripDay *tripDay in self.trip.tripDaysArray) {
		[allTrafficArr addObjectsFromArray:tripDay.trafficArray];
	}
	
	WYTrafficController *trafficController = [[WYTrafficController alloc] init];
	trafficController.trafficArray = allTrafficArr;
	[self.navigationController pushViewController:trafficController animated:YES];
     */
}

- (void)clickHotel:(id)sender {
    /*
	NSMutableArray *allHotelsArr = [NSMutableArray arrayWithCapacity:10];
	for (WYMTripDay *tripDay in self.trip.tripDaysArray) {
		[allHotelsArr addObjectsFromArray:tripDay.hotelsArray];
	}
	
	WYHotelController *hotelContoller = [[WYHotelController alloc] init];
	hotelContoller.hotelsArray = allHotelsArr;
	[self.navigationController pushViewController:hotelContoller animated:YES];
     */
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (_trip.tripDaysArray == nil || [_trip.tripDaysArray count] == 0) {
		return 1;
	}
	return [_trip.tripDaysArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	if (_tripDays == nil || [_tripDays count] == 0) {
//		UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"single"];
//		cell.textLabel.text = @"no result!";
//		return cell;
//	}
	
	static NSString *TRIPDAYCELL = @"TripDayCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPDAYCELL];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPDAYCELL];
	}
	
    WYMTripDay *mTripDay = [_trip.tripDaysArray objectAtIndex:[indexPath row]];
    cell.textLabel.text = [NSString stringWithFormat:@"%i", [[mTripDay dayTH] intValue]];
    
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        NSInteger row = [indexPath row];
//        
//        for (NSInteger i = row+1; i < [_tripDays count]; i++) {
//            WYMTripDay *td = (WYMTripDay *)[_tripDays objectAtIndex:i];
//            [td updateDateInfoWithDayth:[NSNumber numberWithInt:(int)i-1]];
//        }
//        
//        [self.tripDays removeObjectAtIndex:row];
//        [_mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//        [_mTableView reloadData];
//    }
    
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {

//    if (fromIndexPath.row != toIndexPath.row) {
//        WYMTripDay *tripDay = (WYMTripDay *)[self.tripDays objectAtIndex:fromIndexPath.row];
//        [_tripDays removeObject:tripDay];
//        [_tripDays insertObject:tripDay atIndex:toIndexPath.row];
//        
//        for (int i = 0; i < [_tripDays count]; i++) {
//            WYMTripDay *td = (WYMTripDay *)[_tripDays objectAtIndex:i];
//            [td updateDateInfoWithDayth:[NSNumber numberWithInt:i]];
//        }
//        
//        [_mTableView reloadData];
//    }

}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    [[WYDataEngine sharedDataEngine] bisynchronizeTrips];
    
//	WYTripDayController *tripDayController = [[WYTripDayController alloc] init];
//	tripDayController.tripDay = (WYMTripDay *)[_tripDays objectAtIndex:[indexPath row]];
//	tripDayController.tripName = self.trip.tripName;
//	[self.navigationController pushViewController:tripDayController animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

	// ========
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
