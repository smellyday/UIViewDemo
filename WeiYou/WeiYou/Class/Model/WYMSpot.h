//
//  WYMSpot.h
//  WeiYou
//
//  Created by owen on 12/16/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

	//spot include 餐厅、购物、景点、活动
#import <Foundation/Foundation.h>

typedef enum {
	WYSpotElse,
	WYSpotScenic,
	WYSpotFood,
	WYSpotShopping,
	WYSpotAcitivity
} WYSpotsType;

@interface WYMSpot : NSObject {
	WYSpotsType _spotType;
	NSString *_spotName;
	NSString *_spotAddress;
	NSArray *_spotImagesArray;
	NSString *_spotInfo;
	NSString *_spotOpenTimeStr;
	float _admissionPrice;
	NSString *_trafficInfo;
	NSArray *_contactWaysArray;
}

@property (nonatomic) WYSpotsType spotType;
@property (nonatomic, strong) NSString *spotName;
@property (nonatomic, strong) NSString *spotAddress;
@property (nonatomic, strong) NSArray *spotImagesArray;
@property (nonatomic, strong) NSString *spotInfo;
@property (nonatomic, strong) NSString *spotOpenTimeStr;
@property (nonatomic) float admissionPrice;
@property (nonatomic, strong) NSString *trafficInfo;
@property (nonatomic, strong) NSArray *contactWaysArray;

- (id)initWithSpotInfoDic:(NSDictionary *)infoDic;

@end
