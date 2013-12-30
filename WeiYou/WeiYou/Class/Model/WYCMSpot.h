//
//  WYCMSpot.h
//  WeiYou
//
//  Created by zhangpan on 13-12-30.
//  Copyright (c) 2013年 xiyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WYCMCity;

@interface WYCMSpot : NSManagedObject

@property (nonatomic, retain) NSNumber * spotType;
@property (nonatomic, retain) NSString * spotName;
@property (nonatomic, retain) NSString * spotAddress;
@property (nonatomic, retain) NSString * spotInfo;
@property (nonatomic, retain) NSString * spotOpenTimeStr;
@property (nonatomic, retain) NSString * admissionPrice;
@property (nonatomic, retain) NSString * trafficInfo;
@property (nonatomic, retain) WYCMCity *city;

@end
