//
//  TPGestureTableViewCell.h
//  TangGestureTableViewDemo
//
//  Created by kavin on 13-3-16.
//  Copyright (c) 2013年 TangPin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kFeedStatusNormal = 0,
    kFeedStatusLeftExpanded,
    kFeedStatusLeftExpanding,
    kFeedStatusRightExpanded,
    kFeedStatusRightExpanding,
}kFeedStatus;

@class TPGestureTableViewCell;

@protocol TPGestureTableViewCellDelegate <NSObject>

- (void)cellDidBeginPan:(TPGestureTableViewCell *)cell;  
- (void)cellDidReveal:(TPGestureTableViewCell *)cell;      

@end

@interface TPGestureTableViewCell : UITableViewCell<UIGestureRecognizerDelegate>

@property (nonatomic) id<TPGestureTableViewCellDelegate> delegate;
@property (nonatomic) kFeedStatus currentStatus;
@property (nonatomic) BOOL revealing;
@end
