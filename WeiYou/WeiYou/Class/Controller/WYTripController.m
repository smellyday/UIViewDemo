//
//  WYTripController.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripController.h"
#import "WYTripDayController.h"
#import "WYTrafficController.h"
#import "WYHotelController.h"
#import "WYMapViewController.h"
#import "WYTripCell.h"
#import "WYMTripDay.h"
#import "WYMContinent.h"
#import "WYMCountry.h"
#import "WYMCity.h"
#import "consts.h"

@interface WYTripController ()

@end

@implementation WYTripController
@synthesize mTableView = _mTableView;
@synthesize daysArray = _daysArray;
@synthesize trip = _trip;

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
	
	if (self.trip) {
		self.daysArray = self.trip.tripDaysArray;
		self.title = self.trip.tripName;
	}
	
	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
	self.navigationItem.leftBarButtonItem = leftBarItem;
	
	self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:_mTableView];
	
	UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
	self.mTableView.tableHeaderView = buttonContainer;
	
	UIButton *stuffListButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[stuffListButton setTitle:@"行前清单" forState:UIControlStateNormal];
	[stuffListButton setBackgroundColor:[UIColor grayColor]];
	[stuffListButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[stuffListButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[stuffListButton addTarget:self action:@selector(clickStuffList:) forControlEvents:UIControlEventTouchUpInside];
	stuffListButton.frame = CGRectMake(10, 10, 145, 85);
	stuffListButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:stuffListButton];
	
	UIButton *mapButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[mapButton setTitle:@"地图" forState:UIControlStateNormal];
	[mapButton setBackgroundColor:[UIColor grayColor]];
	[mapButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[mapButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[mapButton addTarget:self action:@selector(clickMap:) forControlEvents:UIControlEventTouchUpInside];
	mapButton.frame = CGRectMake(165, 10, 145, 85);
	mapButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:mapButton];
	
	UIButton *trafficButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[trafficButton setTitle:@"交通" forState:UIControlStateNormal];
	[trafficButton setBackgroundColor:[UIColor grayColor]];
	[trafficButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[trafficButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[trafficButton addTarget:self action:@selector(clickTraffic:) forControlEvents:UIControlEventTouchUpInside];
	trafficButton.frame = CGRectMake(10, 105, 145, 85);
	trafficButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:trafficButton];
	
	UIButton *hotelButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[hotelButton setTitle:@"住宿" forState:UIControlStateNormal];
	[hotelButton setBackgroundColor:[UIColor grayColor]];
	[hotelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[hotelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
	[hotelButton addTarget:self action:@selector(clickHotel:) forControlEvents:UIControlEventTouchUpInside];
	hotelButton.frame = CGRectMake(165, 105, 145, 85);
	hotelButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:hotelButton];

}

- (void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)clickStuffList:(id)sender {
	mlog(@"%s", __func__);
}

- (void)clickMap:(id)sender {
	WYMapViewController *mapViewController = [[WYMapViewController alloc] init];
	[self.navigationController pushViewController:mapViewController animated:YES];
}

- (void)clickTraffic:(id)sender {
	NSMutableArray *allTrafficArr = [NSMutableArray arrayWithCapacity:10];
	for (WYMTripDay *tripDay in self.trip.tripDaysArray) {
		[allTrafficArr addObjectsFromArray:tripDay.trafficArray];
	}
	
	WYTrafficController *trafficController = [[WYTrafficController alloc] init];
	trafficController.trafficArray = allTrafficArr;
	[self.navigationController pushViewController:trafficController animated:YES];
}

- (void)clickHotel:(id)sender {
	NSMutableArray *allHotelsArr = [NSMutableArray arrayWithCapacity:10];
	for (WYMTripDay *tripDay in self.trip.tripDaysArray) {
		[allHotelsArr addObjectsFromArray:tripDay.hotelsArray];
	}
	
	WYHotelController *hotelContoller = [[WYHotelController alloc] init];
	hotelContoller.hotelsArray = allHotelsArr;
	[self.navigationController pushViewController:hotelContoller animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (_daysArray == nil || [_daysArray count] == 0) {
		return 1;
	}
	return [_daysArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (_daysArray == nil || [_daysArray count] == 0) {
		UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"single"];
		cell.textLabel.text = @"no result!";
		return cell;
	}
	
	static NSString *TRIPCELL = @"TripCell";
	WYTripCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPCELL];
	
	if (cell == nil) {
		cell = [[WYTripCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPCELL];
	}
	
	WYMTripDay *tripDay = (WYMTripDay *)[self.daysArray objectAtIndex:[indexPath row]];
	cell.dateLabel.text = tripDay.dateStr;
	cell.daythLabel.text = tripDay.dayTHStr;
	cell.weekLabel.text = tripDay.weekDayStr;
	
	NSMutableString *cityStr = [NSMutableString stringWithCapacity:10];
	for (WYMContinent *continent in tripDay.continentsArray) {
		for (WYMCountry *country in continent.countryArray) {
			for (WYMCity *city in country.cityArray) {
				[cityStr appendFormat:@" %@", city.briefName];
			}
		}
	}
	cell.citiesNameLabel.text = cityStr;
	
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	WYTripDayController *tripDayController = [[WYTripDayController alloc] init];
	tripDayController.tripDay = (WYMTripDay *)[self.daysArray objectAtIndex:[indexPath row]];
	tripDayController.tripName = self.trip.tripName;
	[self.navigationController pushViewController:tripDayController animated:YES];
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
