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
#import "WYGlobalState.h"
#import "WYFakeNavBar.h"
#import "WYURLUtility.h"
#import "SecurityUtil.h"
#import "NSObject+JSON.h"
#import "consts.h"


@interface WYSettingsViewController ()

@end

@implementation WYSettingsViewController
@synthesize mTableView = _mTableView;
@synthesize userInfoRequest = _userInfoRequest;
@synthesize userImageRequest = _userImageRequest;
@synthesize callbackRequest = _callbackRequest;

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
	LOGFUNCTION;
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationController.navigationBar.hidden = YES;
    
    // nav bar
	UIButton *cancelBtn = [[UIButton alloc] init];
    cancelBtn.frame = NAV_BAR_LEFT_BTN_FRAME;
	[cancelBtn setBackgroundImage:[UIImage imageNamed:PIC_BACK_N] forState:UIControlStateNormal];
	[cancelBtn addTarget:self action:@selector(onClickCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    
    WYFakeNavBar *fakeNavBar = [[WYFakeNavBar alloc] init];
    [fakeNavBar addSubview:cancelBtn];
	[self.view addSubview:fakeNavBar];
    
    // table view
	self.mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_H+NAV_BAR_H, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_H-NAV_BAR_H) style:UITableViewStylePlain];
	self.mTableView.delegate = self;
	self.mTableView.dataSource = self;
	self.mTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
	self.mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:self.mTableView];
    
    // login notification.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenSinaLoginSuccess:) name:NOTI_SINA_LOGIN_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenQQLoginSuccess:) name:NOTI_QQ_LOGIN_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenWYLoginSuccess:) name:NOTI_WY_LOGIN_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenWYRegisterSuccess:) name:NOTI_WY_REG_OK object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doWhenWYRegisterSuccess:) name:NOTI_WY_RESET_PWD_OK object:nil];
}

- (void)onClickCancelButton:(id)sender {
	LOGFUNCTION;
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if ([[WYGlobalState sharedGlobalState] isLogin]) {
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
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NORMALCELL];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NORMALCELL];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.imageView.image = nil;
    cell.backgroundColor = [UIColor whiteColor];
    
    if (section == 0 && row == 0) {
        
        cell.backgroundColor = [UIColor yellowColor];
        if ([[WYGlobalState sharedGlobalState] isLogin]) {

//            NSString *username = [[WYGlobalState sharedGlobalState] userName];
//			mlog(@"global state : is login \nuser name : %@", username);
//            if (username != nil) {
//                cell.textLabel.text = username;
//            } else {
//                cell.textLabel.text = @"";
//            }
//
//            if ([[WYGlobalState sharedGlobalState] userImage] != nil) {
//                cell.imageView.image = [[WYGlobalState sharedGlobalState] userImage];
//            } else {
//                NSString *imageUrl = [[WYGlobalState sharedGlobalState] userImageUrl];
//                if (imageUrl != nil) {
//                    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:imageUrl]];
//                    [request setDelegate:self];
//                    [request setRequestMethod:@"GET"];
//                    [request startAsynchronous];
//                    self.userImageRequest = request;
//                }
//            }
			
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            
            cell.textLabel.text = [NSString stringWithFormat:@"点击登录"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
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
        
        if ([[WYGlobalState sharedGlobalState] isLogin]) {
            
        } else {
            WYLoginController *loginController = [[WYLoginController alloc] init];
			UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:loginController];
			[navc setNavigationBarHidden:YES];
			[self presentViewController:navc animated:YES completion:nil];
        }
        
    } else if (section == 1 && row == 0) {
		WYUserGuideViewController *mc = [[WYUserGuideViewController alloc] init];
		[self.navigationController pushViewController:mc animated:YES];
	} else if (section == 1 && row == 1) {
        
    } else if (section == 3 && row == 0) {
        [[WYGlobalState sharedGlobalState] logout];
        [self.mTableView reloadData];
        [self.mTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
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

#pragma ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request {
    
//    if (request == _userInfoRequest) {
//        
//        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingMutableContainers error:nil];
//        
//        NSString *userName = [jsonDic objectForKey:@"name"];
//        [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserName:userName];
//        
//        NSString *imgUrl = [jsonDic objectForKey:@"profile_image_url"];
//        [[[WYGlobalState sharedGlobalState] sinaUserInfo] setUserImageUrl:imgUrl];
//        
//        [self.mTableView reloadData];
//        
//    } else
    
//    if (request == _userImageRequest) {
//
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.mTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
//        
//    }
    
//    else if (request == _callbackRequest) {
//        NSString *restr = request.responseString;
//        mlog(@"response string : %@", restr);
//        
//        
//        NSError *merr = nil;
//        NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:&merr];
//        mlog(@"== WY Callback Response info dic : \n%@", [infoDic description]);
//        
//        mlog(@"msg : %@", [NSString stringWithCString:[[infoDic objectForKey:@"msg"] UTF8String] encoding:NSUTF8StringEncoding]);
//        
//        if (merr != nil) {
//            mlog(@"error info : %@", [merr description]);
//        } else {
//            mlog(@"no error");
//        }
//    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	LOGFUNCTION;
    mlog(@"== WY Login Failed Response : %@", [request.error description]);
    NSError *error = request.error;
    if (error.code == 1) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"alert" message:@"Connection Failure Occur!" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertview show];
    }
}


#pragma mark - NOTI
- (void)doWhenSinaLoginSuccess:(id)sender {
	LOGFUNCTION;
    [self.mTableView reloadData];
    
    
//    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
//	[infoDic setObject:@"weibo" forKey:JSON_BODY_KEY_LOGINFROM];/*must be "weibo"*/
//	[infoDic setObject:[[[WYGlobalState sharedGlobalState] sinaUserInfo] userID] forKey:JSON_BODY_KEY_UID3RD];
//	
//	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getThirdPartLoginCallBackURL]];
//	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"third_data"];
//	request.delegate = self;
//	[request startAsynchronous];
//    self.callbackRequest = request;

}

- (void)doWhenQQLoginSuccess:(id)sender {
	LOGFUNCTION;
	[self.mTableView reloadData];
    
//    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
//	[infoDic setObject:@"qq" forKey:JSON_BODY_KEY_LOGINFROM];/*must be "qq"*/
//	[infoDic setObject:[[[WYGlobalState sharedGlobalState] qqUserInfo] openID] forKey:JSON_BODY_KEY_UID3RD];
//    NSLog(@"QQ openid is %@", [[[WYGlobalState sharedGlobalState] qqUserInfo] openID]);
//	
//	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[WYURLUtility getThirdPartLoginCallBackURL]];
//	[request setPostValue:[SecurityUtil encodeBase64String:[infoDic toJSONString]] forKey:@"third_data"];
//	request.delegate = self;
//	[request startAsynchronous];
//    self.callbackRequest = request;
}

- (void)doWhenWYLoginSuccess:(id)sender {
	LOGFUNCTION;
	[self.mTableView reloadData];
}

- (void)doWhenWYRegisterSuccess:(id)sender {
    LOGFUNCTION;
    [self.mTableView reloadData];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
