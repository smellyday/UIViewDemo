//
//  WYAnnotationView.h
//  WeiYou
//
//  Created by owen on 12/24/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <MapKit/MapKit.h>

@protocol WYAnnotationDelegate

- (void)toDetailController;

@end

@interface WYAnnotationView : MKAnnotationView {
    UIView *_calloutview;
}

@property (nonatomic, strong) UIView *calloutview;
@property (nonatomic) id<WYAnnotationDelegate> delegate;

@end
