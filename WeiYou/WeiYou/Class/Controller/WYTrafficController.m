//
//  WYTrafficController.m
//  WeiYou
//
//  Created by owen on 12/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYTrafficController.h"

@interface WYTrafficController ()

@end

@implementation WYTrafficController
@synthesize trafficArray = _trafficArray;

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
	self.title = [NSString stringWithFormat:@"Traffic : %lu", (unsigned long)[_trafficArray count]];
	
	self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
