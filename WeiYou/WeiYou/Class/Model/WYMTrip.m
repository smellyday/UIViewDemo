//
//  WYMTrip.m
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import "WYMTrip.h"
#import "WYMTripDay.h"
#import "consts.h"
#import "WYMContinent.h"
#import "WYMCountry.h"
#import "WYMCity.h"
#import "WYMSpot.h"
#import "WYMUserContinent.h"
#import "WYMUserCountry.h"
#import "WYMUserCity.h"
#import "WYMUserSpot.h"

@implementation WYMTrip
@synthesize tripVersion = _tripVersion;
@synthesize tripOrder = _tripOrder;
@synthesize tripID = _tripID;
@synthesize tripName = _tripName;
@synthesize tripDescription = _tripDescription;
@synthesize tripMainImageURL = _tripMainImageURL;
@synthesize tripBeginDate = _tripBeginDate;
@synthesize tripEndDate = _tripEndDate;
@synthesize tripCreateDate = _tripCreateDate;
@synthesize tripDaysArray = _tripDaysArray;
@synthesize chosenContinentsArray = _chosenContinentsArray;

@synthesize isNewTrip = _isNewTrip;
@synthesize deletTrip = _deletTrip;
@synthesize shouldUpdate = _shouldUpdate;
@synthesize changeWhenUploading = _changeWhenUploading;

- (id)initWithTripInfoDic:(NSDictionary *)infoDic {
	self = [super init];
	if (self) {
		self.tripVersion = [infoDic objectForKey:WY_TRIP_VERSION];
		self.tripOrder = [infoDic objectForKey:WY_TRIP_ORDER];
		self.tripID = [infoDic objectForKey:WY_TRIP_ID];
		self.tripName = [infoDic objectForKey:WY_TRIP_NAME];
		self.tripDescription = [infoDic objectForKey:WY_TRIP_DES];
		self.tripMainImageURL = [infoDic objectForKey:WY_TRIP_MAIN_IMAGE_URL];
		self.tripBeginDate = [infoDic objectForKey:WY_TRIP_BEGIN_DATE];
		self.tripEndDate = [infoDic objectForKey:WY_TRIP_END_DATE];
		self.tripCreateDate = [infoDic objectForKey:WY_TRIP_CREATE_DATE];
		
		_tripDaysArray = [NSMutableArray arrayWithCapacity:10];
        NSArray *daysInfoArr = [infoDic objectForKey:WY_TRIP_DAYS];
		for (NSDictionary *dayInfoDic in daysInfoArr) {
			WYMTripDay *tripDay = [[WYMTripDay alloc] initTripDayInfoDic:dayInfoDic];
            [tripDay updateDateInfoWithBeginDate:_tripBeginDate];
			[_tripDaysArray addObject:tripDay];
		}
		
		_chosenContinentsArray = [NSMutableArray arrayWithCapacity:2];
		
        // the 4 bool must be in the plist. Cz, plist is created by object.
		self.isNewTrip = [[infoDic objectForKey:WY_TRIP_ISNEW] boolValue];
		self.deletTrip = [[infoDic objectForKey:WY_TRIP_ISDEL] boolValue];
		self.shouldUpdate = [[infoDic objectForKey:WY_TRIP_UPDATE] boolValue];
		self.changeWhenUploading = [[infoDic objectForKey:WY_TRIP_CHANGE] boolValue];
	}
	return self;
}

- (void)chooseCity:(WYMUserCity *)city {
//    NSAssert(_chosenContinentsArray != nil, @"_chosenContinentsArray should not be nil!");

    WYMUserContinent *chsCntnnt = [[WYMUserContinent alloc] initWithSystemContinent:city.sysCity.mCountry.mContinent];
    if ([_chosenContinentsArray count] == 0) {
        [_chosenContinentsArray addObject:chsCntnnt];
    } else {
        
        int c = 0;
        for (; c < [_chosenContinentsArray count]; c++) {
            WYMUserContinent *continent = [_chosenContinentsArray objectAtIndex:c];
            if (continent.ID == chsCntnnt.ID) {
                chsCntnnt = continent;
                break;
            }
        }
        if (c >= [_chosenContinentsArray count]) {
            [_chosenContinentsArray addObject:chsCntnnt];
        }
        
    }
    
    WYMUserCountry *chsCntry = [[WYMUserCountry alloc] initWithSystemCountry:city.sysCity.mCountry];
    chsCntry.continentOfUser = chsCntnnt;
    if ([[chsCntnnt chosenCountries] count] == 0) {
        [chsCntnnt addCountry:chsCntry];
    } else {
        
        int c = 0;
        for (; c < [[chsCntnnt chosenCountries] count]; c++) {
            WYMUserCountry *country = [[chsCntnnt chosenCountries] objectAtIndex:c];
            if (country.ID == chsCntry.ID) {
                chsCntry = country;
                break;
            }
        }
        if (c >= [[chsCntnnt chosenCountries] count]) {
            [chsCntnnt addCountry:chsCntry];
        }
        
    }
    
    city.countryOfUser = chsCntry;
    [chsCntry addCity:city];
    
}

- (void)unchooseCity:(WYMUserCity *)city {
    [city.countryOfUser delCity:city];
    
    if ([city.countryOfUser.chosenCities count] == 0) {
        
        [city.countryOfUser.continentOfUser delCountry:city.countryOfUser];
        
        if ([city.countryOfUser.continentOfUser.chosenCountries count] == 0) {
            [_chosenContinentsArray removeObject:city.countryOfUser.continentOfUser];
        }
        
    }
    
}


// network connection.
- (void)addNewTripToServer {
    
}

- (void)deleteTripFromServer {
    
}

- (void)updateTripInfoToServer {
    
}

- (void)updateTripInfoFromServer {
    
}

- (NSMutableArray *)tripDaysArray {
    if (!_tripDaysArray) {
        _tripDaysArray = [NSMutableArray arrayWithCapacity:5];
    }
    
    return _tripDaysArray;
}

- (NSMutableArray *)chosenContinentsArray {
    if (!_chosenContinentsArray) {
        _chosenContinentsArray = [NSMutableArray arrayWithCapacity:2];
    }
    
    return _chosenContinentsArray;
}

- (NSDictionary *)transferToDic {
//    NSMutableDictionary *infoDic = [NSMutableDictionary dictionaryWithCapacity:10];
//    [infoDic setObject:_tripName forKey:WY_TRIP_NAME];
//    [infoDic setObject:_tripDescription forKey:WY_TRIP_DES];
//    [infoDic setObject:_tripMainImageURL forKey:WY_TRIP_MAIN_IMAGE_URL];
//    [infoDic setObject:_tripBeginDate forKey:WY_TRIP_BEGIN_DATE];
//    
//    NSMutableArray *daysArr = [NSMutableArray arrayWithCapacity:10];
//    for (WYMTripDay *tripDay in _tripDaysArray) {
//        NSDictionary *dayInfoDic = [tripDay transferToDic];
//        [daysArr addObject:dayInfoDic];
//    }
//    [infoDic setObject:daysArr forKey:WY_TRIP_DAYS];
//
//    
//    return (NSDictionary *)infoDic;
    
    return nil;
}

@end
