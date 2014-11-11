//
//  WYItinerariesController.m
//  WeiYou
//
//  Created by zhangpan on 14/11/11.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import "WYItinerariesController.h"
#import "WYCreateItineraryController.h"

@interface WYItinerariesController ()

@end

@implementation WYItinerariesController
@synthesize mTableView = _mTableView;
@synthesize userTripAgent = _userTripAgent;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *mRightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:PIC_ADD_NEW_TRIP] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickCreateNew:)];
    mRightButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = mRightButton;
    
    self.userTripAgent = [WYUserTripAgent sharedUserTripAgent];
    
    self.mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.backgroundColor = [UIColor whiteColor];
    self.mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_mTableView];
    
    [_userTripAgent addObserver:_mTableView forKeyPath:CHANGED_ALLUSERTRIPS options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:CHANGED_ALLUSERTRIPS]) {
        [_mTableView reloadData];
    }
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_userTripAgent.userTrips count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TRIPCELL = @"NTRIPCELL";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TRIPCELL];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TRIPCELL];
    }
    
    WYUserTrip *userTrip = [_userTripAgent.userTrips objectAtIndex:[indexPath row]];
    cell.textLabel.text = userTrip.tripName;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

#pragma -- onclick
- (void)onClickCreateNew:(id)sender {
    WYCreateItineraryController *createItnrryController = [[WYCreateItineraryController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:createItnrryController];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:PIC_NAV_BAR_BG] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.hidden = NO;
    
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}







/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
