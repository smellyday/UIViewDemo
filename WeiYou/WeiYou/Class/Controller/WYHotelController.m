//
//  WYHotelController.m
//  WeiYou
//
//  Created by owen on 12/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYHotelController.h"

@interface WYHotelController ()

@end

@implementation WYHotelController
@synthesize hotelsArray = _hotelsArray;

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
	self.title = [NSString stringWithFormat:@"Hotel : %lu", (unsigned long)[_hotelsArray count]];
	
	self.view.backgroundColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
