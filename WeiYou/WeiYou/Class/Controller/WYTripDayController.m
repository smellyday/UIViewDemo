//
//  WYTripDayController.m
//  WeiYou
//
//  Created by owen on 12/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTripDayController.h"
#import "WYTrafficController.h"
#import "WYSpotController.h"
#import "WYHotelController.h"
#import "WYMContinent.h"
#import "WYMCountry.h"
#import "WYMCity.h"
#import "WYMSpot.h"
#import "WYTripDayTrafficCell.h"
#import "WYTripDaySpotCell.h"
#import "WYTripDayHotelCell.h"
#import "WYMTraffic.h"
#import "WYMBookedHotel.h"
#import "consts.h"

@interface WYTripDayController ()

@end

@implementation WYTripDayController
@synthesize mTableView = _mTableView;
@synthesize tripName = _tripName;
@synthesize tripDay = _tripDay;
@synthesize hotelsArray = _hotelsArray;
@synthesize trafficArray = _trafficArray;
@synthesize spotsArray = _spotsArray;

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
	if (self.tripDay) {
		if (self.tripName != nil && ![self.tripName isEqualToString:@""]) {
			self.title = [NSString stringWithFormat:@"%@ : %@", self.tripName, self.tripDay.dayTHStr];
		} else {
			self.title = self.tripDay.dayTHStr;
		}
		
		self.hotelsArray = self.tripDay.hotelsArray;
		self.trafficArray = self.tripDay.trafficArray;
		self.spotsArray = [NSMutableArray arrayWithCapacity:10];
		for (WYMContinent *continent in _tripDay.continentsArray) {
			for (WYMCountry *country in continent.countryArray) {
				for (WYMCity *city in country.cityArray) {
					[self.spotsArray addObjectsFromArray:city.spotsArray];
				}
			}
		}
	}
	
	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
	self.navigationItem.leftBarButtonItem = leftBarItem;
	
	self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.backgroundColor = [UIColor whiteColor];
	[self.mTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
	[self.view addSubview:_mTableView];
	
}

- (void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		
		if (_trafficArray != nil && [_trafficArray count] > 0) {
			return [_trafficArray count];
		} else {
			return 1;
		}
		
	} else if (section == 1) {
		
		if (_spotsArray != nil && [_spotsArray count] > 0) {
			return [_spotsArray count];
		} else {
			return 1;
		}
		
	} else if (section == 2) {
		
		if (_hotelsArray != nil && [_hotelsArray count] > 0) {
			return [_hotelsArray count];
		} else {
			return 1;
		}
		
	}
	
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSInteger section = [indexPath section];
	
	if (section == 0) {
		
		static NSString *TRIPDAYTRAFFICCELL = @"TripDayTrafficCell";
		WYTripDayTrafficCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPDAYTRAFFICCELL];
		
		if (cell == nil) {
			cell = [[WYTripDayTrafficCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPDAYTRAFFICCELL];
		}
		
		if (_trafficArray != nil && [_trafficArray count] > 0) {
			WYMTraffic *traffic = (WYMTraffic *)[_trafficArray objectAtIndex:[indexPath row]];
			if (traffic.trafficType == WYPlane) {
				cell.trafficNumberLabel.text = traffic.flightNumberStr;
			} else if (traffic.trafficType == WYTrain) {
				cell.trafficNumberLabel.text = traffic.trainNumberStr;
			} else {
				cell.trafficNumberLabel.text = @"no number";
			}
			cell.departureLabel.text = traffic.departurePlace;
			cell.destinationLabel.text = traffic.destinationPlace;
			cell.takeOffTimeLabel.text = traffic.takeOffTimeStr;
			cell.priceLabel.text = [NSString stringWithFormat:@"%f", [traffic.trafficPrice floatValue]];
		} else {
			cell.textLabel.text = @"no plane";
		}
		
		return cell;
		
	} else if (section == 1) {
		
		static NSString *TRIPDAYSPOTCELL = @"TripDaySpotCell";
		WYTripDaySpotCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPDAYSPOTCELL];
		
		if (cell == nil) {
			cell = [[WYTripDaySpotCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPDAYSPOTCELL];
		}
		
		if (_spotsArray != nil && [_spotsArray count] > 0) {
			WYMSpot *spot = [_spotsArray objectAtIndex:[indexPath row]];
			cell.spotNameLabel.text = spot.spotName;
			if (spot.spotImagesArray == nil || [spot.spotImagesArray count] == 0) {
				cell.spotImageView.image = [UIImage imageNamed:@"tamp1.png"];
			} else {
				cell.spotImageView.image = [UIImage imageWithData:[spot.spotImagesArray objectAtIndex:0]];
			}
			
		} else {
			cell.textLabel.text = @"no spot";
		}
		
		return cell;
		
	} else {
		
		static NSString *TRIPDAYHOTELCELL = @"TripDayHotelCell";
		WYTripDayHotelCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPDAYHOTELCELL];
		
		if (cell == nil) {
			cell = [[WYTripDayHotelCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPDAYHOTELCELL];
		}
		
		if (_hotelsArray != nil && [_hotelsArray count] > 0) {
			WYMHotel *hotel = [_hotelsArray objectAtIndex:[indexPath row]];
			cell.hotelNameLabel.text = hotel.hotelName;
			cell.hotelAddressLabel.text = hotel.hotelAddress;
			if (hotel.hotelImageArray == nil || [hotel.hotelImageArray count] == 0) {
				cell.hotelImageView.image = [UIImage imageNamed:@"tamp2.png"];
			} else {
				cell.hotelImageView.image = [UIImage imageWithData:[hotel.hotelImageArray objectAtIndex:0]];
			}
			
		} else {
			cell.textLabel.text = @"no hotel";
		}
		
		return cell;
		
	}
	
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	if ([indexPath section] == 0) {
		if (_trafficArray != nil && [_trafficArray count] > 0) {
			WYTrafficController *trafficController = [[WYTrafficController alloc] init];
			trafficController.trafficArray = self.trafficArray;
			[self.navigationController pushViewController:trafficController animated:YES];
		}
	} else if ([indexPath section] == 1) {
		if (_spotsArray != nil && [_spotsArray count] > 0) {
			WYSpotController *spotController = [[WYSpotController alloc] init];
			[self.navigationController pushViewController:spotController animated:YES];
		}
	} else if ([indexPath section] == 2) {
		if (_hotelsArray != nil && [_hotelsArray count] > 0) {
			WYHotelController *hotelContrller = [[WYHotelController alloc] init];
			hotelContrller.hotelsArray = self.hotelsArray;
			[self.navigationController pushViewController:hotelContrller animated:YES];
		}
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 20;
}

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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
