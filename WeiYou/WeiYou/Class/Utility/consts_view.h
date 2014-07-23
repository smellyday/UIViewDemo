//
//  consts_view.h
//  WeiYou
//
//  Created by owen on 7/23/14.
//  Copyright (c) 2014 xiyuan. All rights reserved.
//
#import "consts_utility.h"

#ifndef WeiYou_consts_view_h
#define WeiYou_consts_view_h


#pragma mark ---- color functions
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#pragma mark ----Size ,X,Y, View ,Frame
	//get the  size of the Screen
#define SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height
#define SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define HEIGHT_SCALE  ([[UIScreen mainScreen]bounds].size.height/480.0)

	//get the  size of the Application
#define APP_HEIGHT [[UIScreen mainScreen]applicationFrame].size.height
#define APP_WIDTH [[UIScreen mainScreen]applicationFrame].size.width

#define APP_SCALE_H  ([[UIScreen mainScreen]applicationFrame].size.height/548.0)
#define APP_SCALE_W  ([[UIScreen mainScreen]applicationFrame].size.width/320.0)

	//get the left top origin's x,y of a view
#define VIEW_TX(view) (view.frame.origin.x)
#define VIEW_TY(view) (view.frame.origin.y)

	//get the width size of the view:width,height
#define VIEW_W(view)  (view.frame.size.width)
#define VIEW_H(view)  (view.frame.size.height)

	//get the right bottom origin's x,y of a view
#define VIEW_BX(view) (view.frame.origin.x + view.frame.size.width)
#define VIEW_BY(view) (view.frame.origin.y + view.frame.size.height )

	//get the x,y of the frame
#define FRAME_TX(frame)  (frame.origin.x)
#define FRAME_TY(frame)  (frame.origin.y)
	//get the size of the frame
#define FRAME_W(frame)  (frame.size.width)
#define FRAME_H(frame)  (frame.size.height)

	//utility
#define STATUS_BAR_H    20
#define NAV_BAR_H       44

	//navigation Bar
#define NAV_BAR_BTN_W             40*APP_SCALE_W
#define NAV_BAR_BTN_H             30*APP_SCALE_H
#define NAV_BAR_LEFT_BTN_FRAME    CGRectMake(10*APP_SCALE_W, (NAV_BAR_H-NAV_BAR_BTN_H)/2, NAV_BAR_BTN_W, NAV_BAR_BTN_H)
#define NAV_BAR_RIGHT_BTN_FRAME   CGRectMake(SCREEN_WIDTH-10*APP_SCALE_W-NAV_BAR_BTN_W, (NAV_BAR_H-NAV_BAR_BTN_H)/2, NAV_BAR_BTN_W, NAV_BAR_BTN_H)
#define NAV_BAR_TITLE_W           50*APP_SCALE_W
#define NAV_BAR_TITLE_H           40*APP_SCALE_H
#define NAV_BAR_TITLE_FRAME       CGRectMake(SCREEN_WIDTH/2-NAV_BAR_TITLE_W/2, (NAV_BAR_H-NAV_BAR_TITLE_H)/2, NAV_BAR_TITLE_W, NAV_BAR_TITLE_H)

#endif
