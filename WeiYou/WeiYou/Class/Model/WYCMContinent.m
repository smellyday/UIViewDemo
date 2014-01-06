//
//  WYCMContinent.m
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import "WYCMContinent.h"
#import "WYCoreDataEngine.h"
#import "WYCMCountry.h"
#import "WYCMTripDay.h"
#import "consts.h"


@implementation WYCMContinent

@dynamic continentDes;
@dynamic continentType;
@dynamic tripDay;
@dynamic countries;

- (void)prepareContinentInfoWith:(NSDictionary *)infoDic {
    
    self.continentDes = [infoDic objectForKey:WY_CONTINENT_DES];
    self.continentType = [infoDic objectForKey:WY_CONTINENT_TYPE];
    
    NSArray *countriesArr = [infoDic objectForKey:WY_CONTINENT_COUNTRIES];
    for (NSDictionary *dic in countriesArr) {
        WYCMCountry *country = [NSEntityDescription insertNewObjectForEntityForName:@"WYCMCountry" inManagedObjectContext:[[WYCoreDataEngine sharedCoreDataEngine] context]];
        country.continent = self;
        [country prepareCountryInfoWith:dic];
    }
}

@end
