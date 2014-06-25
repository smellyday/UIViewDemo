//
//  WYCreateNewViewController.m
//  WeiYou
//
//  Created by owen on 12/4/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	// 待解决问题
	// 1动态数据加载
	// 2搜索框以及搜索后数据加载

#import "WYCreateNewViewController.h"
#import "WYDataEngine.h"
#import "WYMCity.h"
#import "WYCityCell.h"
#import "WYTableFooterView.h"
#import "WYCreateNewStepTwoViewController.h"
#import "consts.h"


@interface WYCreateNewViewController (private)

- (void)insertObject:(id)obj toChosenArray:(NSMutableArray *)arr;
- (void)removeObject:(id)obj fromChosenArray:(NSMutableArray *)arr;

- (void)startLoading;
- (void)stopLoading;
- (void)refresh;
- (void)stopLoadingComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
- (void)loadDataFromServer;

- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated;

@end

@implementation WYCreateNewViewController (private)

- (void)insertObject:(id)obj toChosenArray:(NSMutableArray *)arr {
	[arr addObject:obj];
	[[NSNotificationCenter defaultCenter] postNotificationName:WY_NOTI_CHOSEN_ARRAY_CHANGE object:nil];
	return;
}

- (void)removeObject:(id)obj fromChosenArray:(NSMutableArray *)arr {
	[arr removeObject:obj];
	[[NSNotificationCenter defaultCenter] postNotificationName:WY_NOTI_CHOSEN_ARRAY_CHANGE object:nil];
	return;
}

	// -- pull & refresh
- (void)refresh {
	[self performSelector:@selector(loadDataFromServer) withObject:nil afterDelay:2.0];
}

- (void)startLoading {
	_isLoadingMore = YES;
	
		// Show the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    self.mTableView.contentInset = UIEdgeInsetsMake(0, 0, REFRESH_HEADER_HEIGHT, 0);
    _footerView.infoLabel.text = @"is loading ...";
    _footerView.refreshArraw.hidden = YES;
    [_footerView.activityIndicator startAnimating];
    [UIView commitAnimations];
	
		// Refresh action!
    [self refresh];
}

- (void)loadDataFromServer {
	
		//fetch data from server
	WYDataEngine *mDataEngine = [WYDataEngine sharedDataEngine];
	[_cityArray addObjectsFromArray:[mDataEngine getCityArray]];
	
	[_mTableView reloadData];
	[self stopLoading];
}

- (void)stopLoading {
	_isLoadingMore = NO;
	
		// Hide the header
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:.3];
    [UIView setAnimationDidStopSelector:@selector(stopLoadingComplete:finished:context:)];
    self.mTableView.contentInset = UIEdgeInsetsZero;
    [_footerView.refreshArraw layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
    [UIView commitAnimations];
}

- (void)stopLoadingComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    _footerView.infoLabel.text = @"pull & load";
    _footerView.refreshArraw.hidden = NO;
    [_footerView setFrame:CGRectMake(0, self.mTableView.contentSize.height, 320, REFRESH_HEADER_HEIGHT)];
    [_footerView.activityIndicator stopAnimating];
}

- (void)scrollTableViewToSearchBarAnimated:(BOOL)animated {
    [self.mTableView scrollRectToVisible:self.searchBar.frame animated:animated];
}

@end

@implementation WYCreateNewViewController
@synthesize mTableView = _mTableView;
@synthesize cityArray = _cityArray;
@synthesize chosenCityArray = _chosenCityArray;
@synthesize chosenCityScrollView = _chosenCityScrollView;
@synthesize nextButton = _nextButton;
@synthesize footerView = _footerView;
@synthesize strongSearchDisplayController = _strongSearchDisplayController;
@synthesize searchBar = _searchBar;
@synthesize filterArray = _filterArray;
@synthesize isDragging = _isDragging;
@synthesize isLoadingMore = _isLoadingMore;
@synthesize showSearchResult = _showSearchResult;
@synthesize stepTwoController = _stepTwoController;


#pragma init & load view
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
	wylog;
    [super viewDidLoad];
	self.view.backgroundColor = WY_MAIN_COLOR_BG;
	// Do any additional setup after loading the view.
	
		//init header
	UIView *mHeaderContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
	mHeaderContainer.backgroundColor = WY_MAIN_COLOR;
	
		//back button
	UIButton *mBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
	mBackButton.frame = CGRectMake(0, 20, 50, 44);
	[mBackButton setTitle:@"取消" forState:UIControlStateNormal];
	[mBackButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[mBackButton addTarget:self action:@selector(clickCancel:) forControlEvents:UIControlEventTouchDown];
	[mHeaderContainer addSubview:mBackButton];
	
		//title label
	UILabel *mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 44)];
	mTitleLabel.textAlignment = NSTextAlignmentCenter;
	mTitleLabel.textColor = [UIColor blackColor];
	mTitleLabel.text = @"新建计划";
	[mHeaderContainer addSubview:mTitleLabel];
	[self.view addSubview:mHeaderContainer];
	
		//init tableview
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 508-64) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
	self.mTableView.backgroundColor = WY_MAIN_COLOR_BG;
	[self.view addSubview:self.mTableView];
	
		//init search bar
	self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    self.searchBar.placeholder = @"Search";
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
	
	self.mTableView.tableHeaderView = _searchBar;
    self.mTableView.contentOffset = CGPointMake(0, 0);
//	self.strongSearchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
//	self.searchDisplayController.searchResultsDataSource = self;
//    self.searchDisplayController.searchResultsDelegate = self;
//    self.searchDisplayController.delegate = self;
	
		//init chosen scroll
	self.chosenCityScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 508, 64*4, 60)];
	_chosenCityScrollView.backgroundColor = WY_MAIN_COLOR_BG;
	_chosenCityScrollView.opaque = 0.6;
	_chosenCityScrollView.alwaysBounceHorizontal = YES;
	_chosenCityScrollView.alwaysBounceVertical = NO;
	_chosenCityScrollView.pagingEnabled = NO;
	_chosenCityScrollView.scrollEnabled = YES;
	_chosenCityScrollView.showsHorizontalScrollIndicator = YES;
	_chosenCityScrollView.showsVerticalScrollIndicator = NO;
	_chosenCityScrollView.contentSize = CGSizeMake(64*4, 60);
	[self.view addSubview:_chosenCityScrollView];
	
	self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
	_nextButton.frame = CGRectMake(64*4, 508, 64, 60);
	_nextButton.backgroundColor = [UIColor whiteColor];
	[_nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[_nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
	_nextButton.enabled = NO;
	[_nextButton addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
	[_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
	[self.view addSubview:_nextButton];
	
		//init footer view
	self.footerView = [[WYTableFooterView alloc] initWithFrame:CGRectMake(0, self.mTableView.frame.size.height+20, 320, REFRESH_HEADER_HEIGHT)];
	[self.mTableView addSubview:_footerView];
	
		//init data
	WYDataEngine *mDataEngine = [WYDataEngine sharedDataEngine];
	self.cityArray = [NSMutableArray arrayWithCapacity:10];
	[self.cityArray addObjectsFromArray:[mDataEngine getCityArray]];
	self.chosenCityArray = [NSMutableArray arrayWithCapacity:10];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenReceiveNotification:) name:WY_NOTI_CHOSEN_ARRAY_CHANGE object:nil];
	
		//init lazy loading state
	_isDragging = NO;
	_isLoadingMore = NO;
	_showSearchResult = NO;
}

- (void)clickCancel:(id)sender {
	if ([_chosenCityArray count] > 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"计划还没有创建完成，确定放弃么？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
		[alert show];
	} else {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}

- (void)nextStep:(id)sender {
	wylog;
	if ([_chosenCityArray count] > 0) {
		self.stepTwoController = [[WYCreateNewStepTwoViewController alloc] initWithCityInfo:_chosenCityArray];
		_stepTwoController.view.frame = CGRectMake(0, 64, 320, self.view.frame.size.height - 64);
		_stepTwoController.view.alpha = 0;
		[self.view addSubview:_stepTwoController.view];
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:.3];
		_stepTwoController.view.alpha = 1;
		[UIView commitAnimations];
	}
}

- (void)doWhenReceiveNotification:(NSNotification *)mNotification {
	wylog;
	if ([[mNotification name] isEqual:WY_NOTI_CHOSEN_ARRAY_CHANGE]) {
			//动态的添加和删除的效果
			//点击已选择城市，从已选择列表中删除
		if ([_chosenCityArray count] > 0) {
			_nextButton.enabled = YES;
		} else {
			_nextButton.enabled = NO;
		}
		
		if ([_chosenCityArray count] > 4) {
			_chosenCityScrollView.contentSize = CGSizeMake([_chosenCityArray count]*64, 60);
		} else {
			_chosenCityScrollView.contentSize = CGSizeMake(64*4, 60);
		}
		
		[[_chosenCityScrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
		for (int i = 0; i < [_chosenCityArray count]; i++) {
			WYMCity *cm = [_chosenCityArray objectAtIndex:i];
			UILabel *ml = [[UILabel alloc] initWithFrame:CGRectMake(64*i, 0, 64, 60)];
			[ml setText:cm.briefName];
			ml.font = [UIFont systemFontOfSize:15];
			ml.textAlignment = NSTextAlignmentCenter;
			[_chosenCityScrollView addSubview:ml];
		}
		
		if ([_chosenCityArray count] > 4) {
			[_chosenCityScrollView setContentOffset:CGPointMake(([_chosenCityArray count]-4)*64, 0) animated:YES];
		}
		
	}
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (!_showSearchResult) {
		return [self.cityArray count];
	} else {
		return [self.filterArray count];
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CITYCELL = @"CityCell";
	WYCityCell *cell = [tableView dequeueReusableCellWithIdentifier:CITYCELL];
	
	NSInteger row = [indexPath row];
	if (cell == nil) {
		cell = [[WYCityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CITYCELL];
	}
	
	NSArray *cellInfoArr = nil;
	if (!_showSearchResult) {
		cellInfoArr = _cityArray;
	} else {
		cellInfoArr = _filterArray;
	}
	
	WYMCity *model = (WYMCity *)[_cityArray objectAtIndex:row];
	cell.cityModel = model;
	cell.textLabel.text = model.cityName;
	
	if ([_chosenCityArray containsObject:model]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
	return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (_showSearchResult) {
		[_searchBar resignFirstResponder];
	} else {
		_searchBar.text = @"";
		[_searchBar setShowsCancelButton:NO animated:YES];
		[_searchBar resignFirstResponder];
	}
	
	WYCityCell *cell = (WYCityCell *)[tableView cellForRowAtIndexPath:indexPath];
	if ([_chosenCityArray containsObject:cell.cityModel]) {
		[self removeObject:cell.cityModel fromChosenArray:_chosenCityArray];
	} else {
		[self insertObject:cell.cityModel toChosenArray:_chosenCityArray];
	}
	
	[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

#pragma UIScrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	wylog;
	
	[_footerView setFrame:CGRectMake(0, self.mTableView.contentSize.height, 320, REFRESH_HEADER_HEIGHT)];
	
	if (!_showSearchResult) {
		_searchBar.text = @"";
		[_searchBar setShowsCancelButton:NO animated:YES];
		[_searchBar resignFirstResponder];
		_footerView.hidden = NO;
	} else {
		[_searchBar resignFirstResponder];
		_footerView.hidden = YES;
		return;
	}
	
	if (_isLoadingMore) return;
	
//	[_footerView setFrame:CGRectMake(0, self.mTableView.contentSize.height, 320, REFRESH_HEADER_HEIGHT)];
	_isDragging = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	wylog;

	if (_showSearchResult) return;
	
	if (_isLoadingMore && scrollView.contentOffset.y > 0) {
		
		_mTableView.contentInset = UIEdgeInsetsMake(0, 0, REFRESH_HEADER_HEIGHT, 0);
		
	} else if (scrollView.contentSize.height <= (scrollView.bounds.size.height + scrollView.contentOffset.y - scrollView.contentInset.bottom)) {
		
		[UIView beginAnimations:nil context:NULL];
        _footerView.refreshArraw.hidden = NO;
        if ((scrollView.contentSize.height + REFRESH_HEADER_HEIGHT) <= (scrollView.contentOffset.y + scrollView.bounds.size.height - scrollView.contentInset.bottom)) {
            _footerView.infoLabel.text = @"Release to loading ...";
            [_footerView.refreshArraw layer].transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
        } else {
            _footerView.infoLabel.text = @"pull & load";
            [_footerView.refreshArraw layer].transform = CATransform3DMakeRotation(M_PI * 2, 0, 0, 1);
        }
        [UIView commitAnimations];
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	wylog;

	if (_showSearchResult) return;
	
	if (_isLoadingMore) return;
	
	_isDragging = NO;
	
	if ((scrollView.contentSize.height + REFRESH_HEADER_HEIGHT) <= (scrollView.bounds.size.height + scrollView.contentOffset.y - scrollView.contentInset.bottom) && scrollView.contentOffset.y>0) {
		
		[self startLoading];
	}
}

#pragma mark - search bar Delegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
	wylog;
	[searchBar setShowsCancelButton:YES animated:YES];
	return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	wylog;
	
	if (![searchText isEqualToString:@""]) {
		_showSearchResult = YES;
		
		self.filterArray = _cityArray;
		[_mTableView reloadData];
	} else {
		_showSearchResult = NO;
		[_mTableView reloadData];
	}
}

	//click button
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
	wylog;
	[searchBar setShowsCancelButton:NO animated:YES];
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	_showSearchResult = NO;
	[_mTableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	wylog;
	[searchBar resignFirstResponder];
}

//- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
//{
//	self.filterArray = [NSArray arrayWithObjects:@"11", @"22", @"33", nil];
//	
//	[UIView beginAnimations:nil context:NULL];
//	[UIView setAnimationDelegate:self];
//    [UIView setAnimationDuration:.3];
//    _searchBar.frame = CGRectMake(0, 0, _searchBar.frame.size.width, _searchBar.frame.size.height);
//    [UIView commitAnimations];
//	
//}
//
//- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
//{
//    self.filterArray = nil;
//}
//
//- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
////    self.filterArray = [self.filterArray filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%k contains[cd] %@", , searchString]];
//	self.filterArray = [NSArray arrayWithObjects:@"a11", @"a22", @"a33", nil];
//	wylog(@"filter arr count:%d", [_filterArray count]);
//    
//    return YES;
//}


#pragma UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {
	} else if (buttonIndex == 1) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}
}

#pragma memory warning & dealloc
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
