//
//  WYMapViewController.m
//  WeiYou
//
//  Created by owen on 12/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMapViewController.h"
#import "WYSpotController.h"
#import "WYDetailViewController.h"

@interface WYMapAnnotation : NSObject <MKAnnotation> {
//	NSString *title;
//	NSString *subtitle;
//	CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

@end

@implementation WYMapAnnotation
@synthesize title, subtitle, coordinate;

@end


@interface WYMapViewController (private)

-(void)zoomToFitMapAnnotations:(MKMapView*)mapView;

@end

@implementation WYMapViewController
@synthesize mapView = _mapView;
@synthesize spotAnnotionArray = _spotAnnotionArray;
@synthesize tmpAnnoView = _tmpAnnoView;

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
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	self.mapView.delegate = self;
	self.mapView.mapType = MKMapTypeStandard;
	self.mapView.showsUserLocation = YES;
	[self.view addSubview:self.mapView];
	
	UIButton *mb = [UIButton buttonWithType:UIButtonTypeCustom];
	mb.backgroundColor = [UIColor blueColor];
	mb.frame = CGRectMake(0, 100, 100, 50);
	[mb addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:mb];
	
	self.spotAnnotionArray = [NSMutableArray arrayWithCapacity:10];
	
	UILongPressGestureRecognizer *lpr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
	lpr.minimumPressDuration = 0.5;
	[self.mapView addGestureRecognizer:lpr];
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"location" ofType:@"plist"];
    NSArray *locations = [NSArray arrayWithContentsOfFile:filePath];
    for (NSString *locaStr in locations) {
        WYMapAnnotation *annotation = [[WYMapAnnotation alloc] init];
		annotation.title = @"titlefafajfdajfakljflajdfadkfjaldfjalsfjafdaj";
        CGPoint point = CGPointFromString(locaStr);
        annotation.coordinate = CLLocationCoordinate2DMake(point.x, point.y);
		[self.spotAnnotionArray addObject:annotation];
        [self.mapView addAnnotation:annotation];
    }
	[self zoomToFitMapAnnotations:self.mapView];
}

- (void)clickButton:(id)sender {
	
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
    /*
	[self zoomToFitMapAnnotations:self.mapView];
	
	NSInteger annCount = [self.spotAnnotionArray count];
	CLLocationCoordinate2D point[annCount];
	for (int i = 0; i < annCount; i++) {
		WYMapAnnotation *ann = [self.spotAnnotionArray objectAtIndex:i];
		point[i] = ann.coordinate;
	}
	
	MKPolyline *pLine = [MKPolyline polylineWithCoordinates:point count:annCount];
	[self.mapView addOverlay:pLine];
	
	if (_tmpAnnoView == nil) {
		return;
	}
	
	CGPoint tarPoint = CGPointMake(_tmpAnnoView.frame.origin.x+5, _tmpAnnoView.frame.origin.y+5);
	CLLocationCoordinate2D coordinate = [self.mapView convertPoint:tarPoint toCoordinateFromView:self.mapView];
	
	NSLog(@"at: %f, lo: %f", coordinate.latitude, coordinate.longitude);
    */
}

- (void)longPress:(UILongPressGestureRecognizer *)longPressGestureR {
	if (longPressGestureR.state != UIGestureRecognizerStateBegan) {
		return;
	}
	
	CGPoint touchPoint = [longPressGestureR locationInView:self.mapView];
	self.tmpAnnoView = [[UIView alloc] initWithFrame:CGRectMake(touchPoint.x-5, touchPoint.y-5, 10, 10)];
	self.tmpAnnoView.backgroundColor = [UIColor redColor];
	[self.mapView addSubview:_tmpAnnoView];
}

- (void)goDetail:(id)sender {
	WYSpotController *sc = [[WYSpotController alloc] init];
	[self.navigationController pushViewController:sc animated:YES];
}

#pragma MKMapViewDelegate
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay {
	MKPolylineRenderer *pr = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
	pr.lineWidth = 5.0;
	pr.strokeColor = [UIColor redColor];
	return pr;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation {
	if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
	
	NSString *annotationIdentifier = @"CustomViewAnnotation";
	WYAnnotationView *annotationView = (WYAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    if(!annotationView) {
		annotationView = [[WYAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
        annotationView.frame = CGRectMake(0, 0, 8, 40);
        
        annotationView.backgroundColor = [UIColor redColor];
        
        /*
        UIView *mv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
        mv.backgroundColor = [UIColor blueColor];
        annotationView.leftCalloutAccessoryView = mv;
        */
		
//		UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        annotationView.rightCalloutAccessoryView = detailButton;
		
//		annotationView.image = [UIImage imageNamed:@"star.png"];
//		annotationView.canShowCallout= YES;
//		annotationView.animatesDrop = YES;
		
	} else {
		annotationView.annotation = annotation;
	}
    
    annotationView.delegate = self;
	
	return annotationView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
	
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
//	if ([view.annotation isKindOfClass:[WYMapAnnotation class]]) {
//		UIView *vv = [[UIView alloc] initWithFrame:CGRectMake(-50, -50, 120, 50)];
//		vv.backgroundColor = [UIColor yellowColor];
//		vv.tag = 100;
//		
//		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//		btn.frame = CGRectMake(70, 0, 50, 50);
//		[btn setBackgroundColor:[UIColor blueColor]];
//		[btn addTarget:self action:@selector(goDetail:) forControlEvents:UIControlEventTouchUpInside];
//		[vv addSubview:btn];
//		
//		[view addSubview:vv];
//	}
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
//	[[view viewWithTag:100] removeFromSuperview];
//	view.backgroundColor = [UIColor clearColor];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	WYSpotController *sc = [[WYSpotController alloc] init];
	[self.navigationController pushViewController:sc animated:YES];
}

#pragma self function
-(void)zoomToFitMapAnnotations:(MKMapView*)mapView {
    if([mapView.annotations count] == 0)
        return;
	
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
	
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
	
    for(WYMapAnnotation* annotation in mapView.annotations) {
		topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
		topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
		
		bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
		bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
	}
	
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
	
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
}

#pragma WYAnnotationDelegate
- (void)toDetailController {
    WYDetailViewController *dvc = [[WYDetailViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
