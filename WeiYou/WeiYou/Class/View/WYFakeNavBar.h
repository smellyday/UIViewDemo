//
//  WYFakeNavBar.h
//  WeiYou
//
//  Created by zhangpan on 14-7-31.
//  Copyright (c) 2014年 xiyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYFakeNavBar : UIView {
    NSString *_title;
    UILabel *_titleLabel;
}

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UILabel *titleLabel;

@end
