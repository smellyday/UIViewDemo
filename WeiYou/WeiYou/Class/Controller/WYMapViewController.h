//
//  WYMapViewController.h
//  WeiYou
//
//  Created by owen on 12/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface WYMapViewController : UIViewController <MKMapViewDelegate> {
	MKMapView *_mapView;
	NSMutableArray *_spotAnnotionArray;
	UIView *_tmpAnnoView;
}

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray *spotAnnotionArray;
@property (nonatomic, strong) UIView *tmpAnnoView;

@end
