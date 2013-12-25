//
//  WYSettingsViewController.m
//  WeiYou
//
//  Created by owen on 11/18/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYSettingsViewController.h"
#import "WYUserGuideViewController.h"
#import "consts.h"


@interface WYSettingsViewController ()

@end

@implementation WYSettingsViewController
@synthesize mTableView = _mTableView;

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
	self.view.backgroundColor = [UIColor lightGrayColor];
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 504) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	
		//init header
	UIView *mHeaderContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
	mHeaderContainer.backgroundColor = WY_MAIN_COLOR;
	
		//back button
	UIButton *mBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
	mBackButton.frame = CGRectMake(0, 20, 50, 44);
	[mBackButton setTitle:@"返回" forState:UIControlStateNormal];
	[mBackButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[mBackButton addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchDown];
	[mHeaderContainer addSubview:mBackButton];
	
		//title label
	UILabel *mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 20, 100, 44)];
	mTitleLabel.textAlignment = NSTextAlignmentCenter;
	mTitleLabel.textColor = [UIColor blackColor];
	mTitleLabel.text = @"设置";
	[mHeaderContainer addSubview:mTitleLabel];
	
	[self.view addSubview:mHeaderContainer];
	[self.view addSubview:self.mTableView];

}

- (void)clickBack:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 4;
	} else if (section == 1) {
		return 2;
	} else {
		return 1;
	}

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *NORMALCELL = @"Cell";
	static NSString *HEADCELL = @"Info";
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
	if (row == 0 && section == 0) {
		UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HEADCELL];
		cell.userInteractionEnabled = NO;
		
		UIView *mContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
		UIImageView *mImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.jpg"]];
		mImageView.frame = CGRectMake(10, 10, 140, 140);
		[mContentView addSubview:mImageView];
		
		[cell.contentView addSubview:mContentView];
		
		return cell;
	} else {
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
		if (cell == nil) {
			cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NORMALCELL];
		}
		
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.textLabel.textColor = [UIColor blackColor];
		cell.backgroundColor = WY_CELL_COLOR;
		tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
		
		if (section == 0 && row == 1) {
				// user guide
			cell.textLabel.text = [NSString stringWithFormat:@"用户指南"];
		} else if (section == 0 && row == 2) {
				// introduce to friends
			cell.textLabel.text = [NSString stringWithFormat:@"推荐给好友"];
		} else if (section == 0 && row == 3) {
				// feedback
			cell.textLabel.text = [NSString stringWithFormat:@"意见反馈"];
		} else if (section == 1 && row == 0) {
				// about us
			cell.textLabel.text = [NSString stringWithFormat:@"关于我们"];
		} else if (section == 1 && row == 1) {
				// evaluate
			cell.textLabel.text = [NSString stringWithFormat:@"到AppStore评价"];
		} else if (section == 2 && row == 0) {
				// log out
			cell.textLabel.textColor = [UIColor whiteColor];
			cell.textLabel.textAlignment = NSTextAlignmentCenter;
			cell.textLabel.frame = CGRectMake(100, 0, cell.frame.size.width, cell.frame.size.height);
			cell.accessoryType = UITableViewCellAccessoryNone;
			cell.textLabel.text = @"退出登录";
			tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
			
			UIView *normalView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
			normalView.backgroundColor = [UIColor colorWithRed:0.69 green:0 blue:0 alpha:1];
			UIView *selectedView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
			selectedView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
			cell.backgroundView = normalView;
			cell.selectedBackgroundView = selectedView;
		}
		
		return cell;
	}
	
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSInteger section = [indexPath section];
	NSInteger row = [indexPath row];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (section == 0 && row == 1) {
		WYUserGuideViewController *mc = [[WYUserGuideViewController alloc] init];
		[self.navigationController pushViewController:mc animated:YES];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([indexPath row] == 0 && [indexPath section] == 0) {
		return 160;
	} else if ([indexPath section] == 2) {
		return 60;
	}else {
		return 80;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return 0;
	} else {
		return 30;
	}
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
