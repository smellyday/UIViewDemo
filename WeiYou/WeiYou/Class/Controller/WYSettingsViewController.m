//
//  WYSettingsViewController.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYSettingsViewController.h"
#import "WYUserGuideViewController.h"
#import "WYLoginController.h"
#import "consts.h"


@interface WYSettingsViewController ()

@end

@implementation WYSettingsViewController
@synthesize mTableView = _mTableView;
@synthesize globalState = _globalState;

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
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	
    self.title = @"设置";
	
	UIBarButtonItem *mLeftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBackPage:)];
	self.navigationItem.leftBarButtonItem = mLeftButton;
    
	[self.view addSubview:self.mTableView];

    // tmp login state;
    self.globalState = [WYGlobalState sharedGlobalState];
    _globalState.boolLogin = NO;
}

- (void)goBackPage:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (_globalState.boolLogin) {
        return 4;
    } else {
        return 3;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
	if (section == 0) {
		return 1;
	} else if (section == 1) {
		return 4;
	} else if (section == 2) {
		return 2;
	} else {
        return 1;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *NORMALCELL = @"Cell";
//	static NSString *HEADCELL = @"Info";
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NORMALCELL];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    if (section == 0 && row == 0) {
        
        if (_globalState.boolLogin) {
            cell.textLabel.text = [NSString stringWithFormat:@"owen_zhsng"];
        } else {
            cell.textLabel.text = [NSString stringWithFormat:@"点击登录"];
        }
        
    } else if (section == 1 && row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"用户指南"];
    } else if (section == 1 && row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"连接社交网络"];
    } else if (section == 1 && row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"意见反馈"];
    } else if (section == 1 && row == 3) {
        cell.textLabel.text = [NSString stringWithFormat:@"到AppStore评价"];
    } else if (section == 2 && row == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"关于我们"];
    } else if (section == 2 && row == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"清楚浏览缓存"];
    } else if (section == 3 && row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.text = [NSString stringWithFormat:@"退出登录"];
    }
    
    return cell;

}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (section == 0 && row == 0) {
        
        if (_globalState.boolLogin) {
            
        } else {
            WYLoginController *loginController = [[WYLoginController alloc] init];
            [self.navigationController pushViewController:loginController animated:YES];
        }
        
    } else if (section == 0 && row == 1) {
		WYUserGuideViewController *mc = [[WYUserGuideViewController alloc] init];
		[self.navigationController pushViewController:mc animated:YES];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([indexPath row] == 0 && [indexPath section] == 0) {
		return 100;
	} else {
		return 80;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
	return 20;
}


/*
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	if (section == 2) {
		return 200;
	}
	
	return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	if (section == 2) {
		UIView *mFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
		UIImage *mImg = [UIImage imageNamed:@"logo.jpg"];
		UIImageView *mImgView = [[UIImageView alloc] initWithImage:mImg];
		[mFooterView addSubview:mImgView];
		return mFooterView;
	}
	return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
	return 500;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	wylog(@"touch me!!!!");
}
*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
