//
//  WYCreateNewViewController.h
//  WeiYou
//
//  Created by owen on 12/4/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYTableFooterView, WYCreateNewStepTwoViewController;
@interface WYCreateNewViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate> {
	UITableView *_mTableView;
	NSMutableArray *_cityArray;
	NSMutableArray *_chosenCityArray;
	UIScrollView *_chosenCityScrollView;
	UIButton *_nextButton;
	
	UISearchBar *_searchBar;
	UISearchDisplayController *_strongSearchDisplayController;
	NSArray *_filterArray;
	BOOL _showSearchResult;
	
	WYCreateNewStepTwoViewController *_stepTwoController;
	
	WYTableFooterView *_footerView;
	@protected
	BOOL _isDragging;
	BOOL _isLoadingMore;
	
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableArray *chosenCityArray;
@property (nonatomic, strong) UIScrollView *chosenCityScrollView;
@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *strongSearchDisplayController;
@property (nonatomic, strong) NSArray *filterArray;
@property (nonatomic) BOOL showSearchResult;

@property (nonatomic, strong) WYCreateNewStepTwoViewController *stepTwoController;

@property (nonatomic, strong) WYTableFooterView *footerView;

//protected
@property (readonly) BOOL isDragging;
@property (readonly) BOOL isLoadingMore;


@end
