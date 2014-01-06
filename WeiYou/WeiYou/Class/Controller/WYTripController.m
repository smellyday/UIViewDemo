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

#import "consts.h"
#import "WYCoreDataEngine.h"

#import "WYCMTripDay.h"
#import "WYCMContinent.h"
#import "WYCMCountry.h"
#import "WYCMCity.h"
#import "WYCMSpot.h"


@interface WYTripController (private)

- (void)refresh;

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

/*
- (void)refresh {
    [_daysArray removeAllObjects];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"WYCMTripDay"];
    request.predicate = [NSPredicate predicateWithFormat:@"SELF.trip.tripIndex == %@", self.trip.tripIndex];
    NSSortDescriptor *sortDes = [NSSortDescriptor sortDescriptorWithKey:@"dayth" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDes];
    NSError *merr;
    NSArray *trips = [[[WYCoreDataEngine sharedCoreDataEngine] context] executeFetchRequest:request error:&merr];
    [_daysArray addObjectsFromArray:trips];
    
}
*/

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
    self.daysArray = [NSMutableArray arrayWithCapacity:10];
	if (self.trip) {

        NSSortDescriptor *sortDes = [[NSSortDescriptor alloc] initWithKey:@"dayth" ascending:YES];
        [self.daysArray addObjectsFromArray:[[[self.trip tripDays] allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDes]]];
		self.title = self.trip.tripName;
		
	}
	
	UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
	self.navigationItem.leftBarButtonItem = leftBarItem;
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editDays:)];
	self.navigationItem.rightBarButtonItem = rightBarItem;
	
	self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:_mTableView];
	
    //header view
	UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 140)];
	self.mTableView.tableHeaderView = buttonContainer;
	
	UIButton *stuffListButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[stuffListButton setTitle:@"行前清单" forState:UIControlStateNormal];
	[stuffListButton setBackgroundColor:[UIColor greenColor]];
	[stuffListButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[stuffListButton addTarget:self action:@selector(clickStuffList:) forControlEvents:UIControlEventTouchUpInside];
	stuffListButton.frame = CGRectMake(0, 0, 160, 70);
	stuffListButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:stuffListButton];
	
	UIButton *mapButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[mapButton setTitle:@"地图" forState:UIControlStateNormal];
	[mapButton setBackgroundColor:[UIColor redColor]];
	[mapButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[mapButton addTarget:self action:@selector(clickMap:) forControlEvents:UIControlEventTouchUpInside];
	mapButton.frame = CGRectMake(160, 0, 160, 70);
	mapButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:mapButton];
	
	UIButton *trafficButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[trafficButton setTitle:@"交通" forState:UIControlStateNormal];
	[trafficButton setBackgroundColor:[UIColor blueColor]];
	[trafficButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[trafficButton addTarget:self action:@selector(clickTraffic:) forControlEvents:UIControlEventTouchUpInside];
	trafficButton.frame = CGRectMake(0, 70, 160, 70);
	trafficButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:trafficButton];
	
	UIButton *hotelButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[hotelButton setTitle:@"住宿" forState:UIControlStateNormal];
	[hotelButton setBackgroundColor:[UIColor yellowColor]];
	[hotelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[hotelButton addTarget:self action:@selector(clickHotel:) forControlEvents:UIControlEventTouchUpInside];
	hotelButton.frame = CGRectMake(160, 70, 160, 70);
	hotelButton.titleLabel.font = [UIFont systemFontOfSize:25];
	[buttonContainer addSubview:hotelButton];
    
    //footer view
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    footerView.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *addOneDayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addOneDayButton.frame = CGRectMake(60, 10, 200, 80);
    addOneDayButton.backgroundColor = [UIColor blueColor];
    [addOneDayButton setTitle:@"增加一天" forState:UIControlStateNormal];
    [addOneDayButton addTarget:self action:@selector(addOneDay:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:addOneDayButton];
    
    self.mTableView.tableFooterView = footerView;

}

- (void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void)editDays:(id)sender {
    [_mTableView setEditing:!_mTableView.editing animated:YES];
    if (_mTableView.editing) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
    }
	
	/*
    NSArray *userDomainArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *filePath = [NSString stringWithFormat:@"%@/%@", [userDomainArray objectAtIndex:0], @"hello.plist"];
	NSFileManager *mFileManager = [[NSFileManager alloc] init];
	if (![mFileManager fileExistsAtPath:filePath]) {
        [mFileManager createFileAtPath:filePath contents:nil attributes:nil];
	}
    
    NSDictionary *dayInfoDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
	*/
}

- (void)addOneDay:(id)sender {
    WYCMTripDay *tripDay = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMTripDay" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
    tripDay.trip = self.trip;
    NSDictionary *infoDic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:[self.trip.tripDays count]-1] forKey:WY_TRIP_DAYTH];// -1 because after tripday.trip = self.trip.
    [tripDay prepareTripDayWithInfo:infoDic];
    [_daysArray addObject:tripDay];
    [_mTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[self.trip.tripDays count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
//    [_mTableView reloadData];
    
}

- (void)clickStuffList:(id)sender {
	mlog(@"%s", __func__);
}

- (void)clickMap:(id)sender {
	WYMapViewController *mapViewController = [[WYMapViewController alloc] init];
	[self.navigationController pushViewController:mapViewController animated:YES];
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
	
	WYCMTripDay *tripDay = (WYCMTripDay *)[self.daysArray objectAtIndex:[indexPath row]];
	[tripDay prepareTripDayInfo];
	cell.dateLabel.text = tripDay.dateStr;
	cell.daythLabel.text = tripDay.dayTHStr;
	cell.weekLabel.text = tripDay.weekDayStr;
	
    cell.citiesNameLabel.text = [NSString stringWithFormat:@"暂无安排, dayth:%d", [tripDay.dayth intValue]];

	NSMutableString *cityStr = [NSMutableString stringWithCapacity:10];
	for (WYCMContinent *continent in tripDay.continents) {
		for (WYCMCountry *country in continent.countries) {
			for (WYCMCity *city in country.cities) {
				[cityStr appendFormat:@" %@", city.briefName];
			}
		}
	}
    if (cityStr == nil || [cityStr isEqualToString:@""]) {
        cell.citiesNameLabel.text = @"暂无安排";
    } else {
        cell.citiesNameLabel.text = cityStr;
    }

    
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    mlog(@"%s", __func__);
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger row = [indexPath row];
        WYCMTripDay *tripDay = (WYCMTripDay *)[self.daysArray objectAtIndex:row];
        [[[WYCoreDataEngine sharedCoreDataEngine] context] deleteObject:tripDay];
//        [self.trip removeTripDaysObject:tripDay];
        
        for (NSInteger i = row+1; i < [_daysArray count]; i++) {
            WYCMTripDay *td = (WYCMTripDay *)[self.daysArray objectAtIndex:i];
            td.dayth = [NSNumber numberWithInt:i-1];
        }
        
        [self.daysArray removeObjectAtIndex:row];
        [_mTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [_mTableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    if (fromIndexPath.row != toIndexPath.row) {
        WYCMTripDay *tripDay = (WYCMTripDay *)[self.daysArray objectAtIndex:fromIndexPath.row];
        [self.daysArray removeObject:tripDay];
        [self.daysArray insertObject:tripDay atIndex:toIndexPath.row];
        
        for (int i = 0; i < [_daysArray count]; i++) {
            WYCMTripDay *td = (WYCMTripDay *)[self.daysArray objectAtIndex:i];
            td.dayth = [NSNumber numberWithInt:i];
        }
        
        [_mTableView reloadData];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
    
	WYTripDayController *tripDayController = [[WYTripDayController alloc] init];
	tripDayController.tripDay = (WYCMTripDay *)[self.daysArray objectAtIndex:[indexPath row]];
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
