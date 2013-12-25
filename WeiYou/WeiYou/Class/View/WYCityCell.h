//
//  WYCityCell.h
//  WeiYou
//
//  Created by owen on 12/4/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYMCity.h"

@interface WYCityCell : UITableViewCell {
	WYMCity *_cityModel;
}

@property (nonatomic, strong) WYMCity *cityModel;


@end
