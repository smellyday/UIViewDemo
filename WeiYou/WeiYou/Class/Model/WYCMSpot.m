//
//  WYCMSpot.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMSpot.h"
#import "WYCoreDataEngine.h"
#import "WYCMCity.h"
#import "consts.h"


@implementation WYCMSpot

@dynamic spotIndex;
@dynamic spotType;
@dynamic spotName;
@dynamic spotAddress;
@dynamic spotInfo;
@dynamic spotOpenTimeStr;
@dynamic admissionPrice;
@dynamic trafficInfo;
@dynamic city;

- (void)prepareSpotInfoWith:(NSDictionary *)infoDic {
    self.spotIndex = [infoDic objectForKey:WY_SPOT_INDEX];
    self.spotType = [infoDic objectForKey:WY_SPOT_TYPE];
    self.spotName = [infoDic objectForKey:WY_SPOT_NAME];
    self.spotAddress = [infoDic objectForKey:WY_SPOT_ADDRESS];
    self.spotInfo = [infoDic objectForKey:WY_SPOT_INFO];
    self.spotOpenTimeStr = [infoDic objectForKey:WY_SPOT_OPEN_TIME];
    self.trafficInfo = [infoDic objectForKey:WY_SPOT_TRAFFIC_INFO];
}

@end
