//
//  WYCMCountry.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMCountry.h"
#import "WYCoreDataEngine.h"
#import "WYCMCity.h"
#import "consts.h"


@implementation WYCMCountry

@dynamic countryName;
@dynamic countryDes;
@dynamic continent;
@dynamic cities;

- (void)prepareCountryInfoWith:(NSDictionary *)infoDic {
    self.countryName = [infoDic objectForKey:WY_COUNTRY_NAME];
    self.countryDes = [infoDic objectForKey:WY_COUNTRY_DES];
    
    NSArray *citiesArr = [infoDic objectForKey:WY_COUNTRY_CITIES];
    for (NSDictionary *dic in citiesArr) {
        WYCMCity *city = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMCity" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        city.country = self;
        [city prepareCityInfoWith:dic];
    }
}

@end
