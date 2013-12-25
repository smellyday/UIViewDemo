//
//  WYSpotController.m
//  WeiYou
//
//  Created by owen on 12/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYSpotController.h"

@interface WYSpotController ()

@end

@implementation WYSpotController

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
	self.title = @"Spot";
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIView *mapView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
	mapView.backgroundColor = [UIColor greenColor];
	UILabel *mapLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
	mapLabel.font = [UIFont boldSystemFontOfSize:30];
	mapLabel.textAlignment = NSTextAlignmentCenter;
	mapLabel.text = @"M A P";
	[mapView addSubview:mapLabel];
	[self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
