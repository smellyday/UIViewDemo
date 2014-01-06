//
//  WYCMCity.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMCity.h"
#import "WYCoreDataEngine.h"
#import "WYCMSpot.h"
#import "consts.h"


@implementation WYCMCity

@dynamic cityName;
@dynamic cityDes;
@dynamic briefName;
@dynamic country;
@dynamic spots;

- (void)prepareCityInfoWith:(NSDictionary *)infoDic {
    self.cityName = [infoDic objectForKey:WY_CITY_NAME];
    self.cityDes = [infoDic objectForKey:WY_CITY_DES];
    self.briefName = [infoDic objectForKey:WY_CITY_BRIEF_NAME];
    
    NSArray *spotsArr = [infoDic objectForKey:WY_CITY_SPOTS];
    for (NSDictionary *dic in spotsArr) {
        WYCMSpot *spot = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMSpot" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        spot.city = self;
        [spot prepareSpotInfoWith:dic];
    }
}

@end
