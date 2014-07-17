//
//  WYUploadTripOperation.h
//  WeiYou
//
//  Created by zhangpan on 14-7-17.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYMTrip.h"

@interface WYUploadTripOperation : NSOperation {
    WYMTrip *_trip;
}

@property (nonatomic) int sym;
@property (nonatomic, strong) WYMTrip *trip;

- (id)initWithTrip:(WYMTrip *)mtrip;

@end
