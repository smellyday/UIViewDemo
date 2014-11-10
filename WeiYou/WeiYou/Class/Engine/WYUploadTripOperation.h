//
//  WYUploadTripOperation.h
//  WeiYou
//
//  Created by zhangpan on 14-7-17.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUserTrip.h"

@interface WYUploadTripOperation : NSOperation {
    WYUserTrip *_trip;
}

@property (nonatomic) int sym;
@property (nonatomic, strong) WYUserTrip *trip;

- (id)initWithTrip:(WYUserTrip *)mtrip;

@end
