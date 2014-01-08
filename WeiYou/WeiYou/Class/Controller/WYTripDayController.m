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

#import "WYTripDayTrafficCell.h"
#import "WYTripDaySpotCell.h"
#import "WYTripDayHotelCell.h"

#import "WYCMTraffic.h"
#import "WYCMHotel.h"
#import "WYCMSpot.h"
#import "WYCMContinent.h"
#import "WYCMCountry.h"
#import "WYCMCity.h"

#import "WYCoreDataEngine.h"
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
    
    self.trafficArray = [NSMutableArray arrayWithCapacity:10];
    self.hotelsArray = [NSMutableArray arrayWithCapacity:10];
    self.spotsArray = [NSMutableArray arrayWithCapacity:10];
    
	if (self.tripDay) {
        
        if (self.tripName != nil && ![self.tripName isEqualToString:@""]) {
			self.title = [NSString stringWithFormat:@"%@ : %@", self.tripName, self.tripDay.dayTHStr];
		} else {
			self.title = self.tripDay.dayTHStr;
		}
        
        NSSortDescriptor *sortTrafficDes = [[NSSortDescriptor alloc] initWithKey:@"takeOffTime" ascending:YES];
        [self.trafficArray addObjectsFromArray:[[self.tripDay.traffics allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortTrafficDes]]];
        
        NSSortDescriptor *sortHotelDes = [[NSSortDescriptor alloc] initWithKey:@"dateCheckIn" ascending:YES];
        [self.hotelsArray addObjectsFromArray:[[self.tripDay.hotels allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortHotelDes]]];
        
        NSMutableArray *sptArr = [NSMutableArray arrayWithCapacity:10];
		for (WYCMContinent *continent in self.tripDay.continents) {
			for (WYCMCountry *country in continent.countries) {
				for (WYCMCity *city in country.cities) {
                    [sptArr addObjectsFromArray:[city.spots allObjects]];
				}
			}
		}
        NSSortDescriptor *sortSpotDes = [[NSSortDescriptor alloc] initWithKey:@"spotIndex" ascending:YES];
        self.spotsArray = [NSMutableArray arrayWithArray:[sptArr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortSpotDes]]];
	}
	
	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
	self.navigationItem.leftBarButtonItem = leftBarItem;
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
	self.navigationItem.rightBarButtonItem = rightBarItem;
	
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

- (void)edit:(id)sender {
    [_mTableView setEditing:!_mTableView.editing animated:YES];
    if (_mTableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
    }
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
			WYCMTraffic *traffic = (WYCMTraffic *)[_trafficArray objectAtIndex:[indexPath row]];
            [traffic prepareTrafficInfo];
			if ([traffic.trafficType intValue] == 1) {
				cell.trafficNumberLabel.text = traffic.flightNumberStr;
			} else if ([traffic.trafficType intValue] == 2) {
				cell.trafficNumberLabel.text = traffic.trainNumberStr;
			} else {
				cell.trafficNumberLabel.text = @"no this type traffic";
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
			WYCMSpot *spot = (WYCMSpot *)[_spotsArray objectAtIndex:[indexPath row]];
			cell.spotNameLabel.text = [NSString stringWithFormat:@"%d :%@", [spot.spotIndex intValue], spot.spotName];
            cell.spotImageView.image = [UIImage imageNamed:@"tamp1.png"];
			
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
			WYCMHotel *hotel = (WYCMHotel *)[_hotelsArray objectAtIndex:[indexPath row]];
			cell.hotelNameLabel.text = hotel.hotelName;
			cell.hotelAddressLabel.text = hotel.hotelAddress;
            cell.hotelImageView.image = [UIImage imageNamed:@"tamp2.png"];
		} else {
			cell.textLabel.text = @"no hotel";
		}
		
		return cell;
		
	}
	
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger row = [indexPath row];
        WYCMSpot *spot = (WYCMSpot *)[self.spotsArray objectAtIndex:row];
        [[[WYCoreDataEngine sharedCoreDataEngine] context] deleteObject:spot];
        
        for (NSInteger i = row+1; i < [_spotsArray count]; i++) {
            WYCMSpot *spt = [_spotsArray objectAtIndex:i];
            spt.spotIndex = [NSNumber numberWithInt:i-1];
        }
        [self.spotsArray removeObject:spot];
        [_mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_mTableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return YES;
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
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
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];

    
	if ([indexPath section] == 0) {
        /*
		if (_trafficArray != nil && [_trafficArray count] > 0) {
			WYTrafficController *trafficController = [[WYTrafficController alloc] init];
			trafficController.trafficArray = self.trafficArray;
			[self.navigationController pushViewController:trafficController animated:YES];
		}
        */
	} else if ([indexPath section] == 1) {
		if (_spotsArray != nil && [_spotsArray count] > 0) {
			WYSpotController *spotController = [[WYSpotController alloc] init];
			[self.navigationController pushViewController:spotController animated:YES];
		}
	} else if ([indexPath section] == 2) {
        /*
		if (_hotelsArray != nil && [_hotelsArray count] > 0) {
			WYHotelController *hotelContrller = [[WYHotelController alloc] init];
			hotelContrller.hotelsArray = self.hotelsArray;
			[self.navigationController pushViewController:hotelContrller animated:YES];
		}
        */
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 5;
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
