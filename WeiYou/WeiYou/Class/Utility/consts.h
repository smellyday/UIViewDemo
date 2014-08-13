//
//  consts.h
//  WeiYou
//
//  Created by owen on 11/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//
#import "log.h"
#import "consts_sys_pic.h"
#import "consts_view.h"
#import "consts_utility.h"
#import "consts_network.h"
#import "consts_language.h"
#import "WYNavigationController.h"

#ifndef WeiYou_consts_h
#define WeiYou_consts_h


#define APP_GROUP                           @"4RH97J3HKQ.com.200.WeiYou"
#define APP_CHANNEL                         @"1001"
#define APP_VERSION                         @"0.0.0.1"
#define KEYCHAIN_ID                         @"WHATEVER"

//========character color========
#define CHAR_COLOR_ON_BTN                  [UIColor colorWithRed:0 green:136/256 blue:187/256 alpha:1.0]

//========one day interval=======
#define WY_DAY_INTERVAL 86400

//========LOGIN========
#define PREFIX_SINA                         @"wb"
#define PREFIX_QQ                           @"tencent"

#define QQAppID @"222222"/*@"1101890874"*/
#define SinaWeiboAppKey @"211678035"
#define SinaRedirectUrl @"http://www.baidu.com"

//========KEY SINA login info========
#define SINA_USER_TOKEN                       @"sina_token"
#define SINA_USER_WY_TOKEN                    @"sina_wy_token"
#define SINA_USER_ID                          @"sina_user_id"
#define SINA_USER_NAME                        @"sina_user_name"
#define SINA_USER_PROFILE_IMAGE_URL           @"sina_user_profile_image_url"
#define SINA_USER_PROFILE_IMAGE_DATA          @"sina_user_profile_image_data"
//========KEY wy login info========
#define WY_USER_TOKEN                         @"wy_token"
#define WY_USER_ID                            @"wy_user_id"
#define WY_USER_NAME                          @"wy_user_name"
#define WY_USER_PROFILE_IMAGE_URL             @"wy_user_profile_image_url"
#define WY_USER_PROFILE_IMAGE_DATA            @"wy_user_profile_image_data"
//========KEY QQ login info========
#define QQ_USER_TOKEN                         @"qq_token"
#define QQ_USER_WY_TOKEN                      @"qq_wy_token"
#define QQ_OPEN_ID                            @"qq_open_id"
#define QQ_EXPIRATION_DATE                    @"qq_expiration_date"
#define QQ_USER_NAME                          @"qq_user_name"
#define QQ_USER_PROFILE_IMAGE_URL             @"qq_user_profile_image_url"
#define QQ_USER_PROFILE_IMAGE_DATA            @"qq_user_profile_image_data"
//========KEY Global login info========
//#define GLOBAL_USER_NAME					  @"global_user_name"
//#define GLOBAL_LOGIN_ACCOUNT				  @"global_login_account"
//#define GLOBAL_USER_PROFILE_IMAGE_URL         @"global_user_profile_image_url"
//#define GLOBAL_USER_PROFILE_IMAGE             @"global_user_profile_image"
//#define GLOBAL_ACCOUNT						  @"global_account"
#define GLOBAL_PARAM_CP                       @"global_wy_cp"
#define GLOBAL_PARAM_UUID                     @"global_wy_uuid"


//========notification center========
#define NOTI_CHOSEN_ARRAY_CHANGE            @"ChosenArrayChange" // for create new trip
#define NOTI_TRIPS_DATA_OK                  @"trips_data_ok"
#define NOTI_TRIPS_SYNC_FINISH              @"trips_sync_finish"
#define NOTI_SINA_AUTH_OK                   @"noti_sina_auth_ok"
//#define NOTI_SINA_LOGIN_OK                  @"noti_sina_login"
//#define NOTI_SINA_LOGOUT                    @"noti_sina_logout"
#define NOTI_QQ_AUTH_OK                     @"noti_qq_auth_ok"
//#define NOTI_QQ_LOGIN_OK                    @"noti_qq_login"
//#define NOTI_QQ_LOGOUT                      @"noti_qq_logout"
#define NOTI_LOGIN_OK                       @"noti_login_ok"
//#define NOTI_WY_LOGIN_OK                    @"noti_wy_login"
//#define NOTI_WY_LOGOUT                      @"noti_wy_logout"
#define NOTI_WY_REG_OK                      @"noti_wy_reg_ok"
#define NOTI_WY_RESET_PWD_OK                @"noti_wy_reset_pwd_ok"

//========data file========
#define WY_FILE_TRIPS                  @"trips.plist"
#define WY_FILE_CITIES                 @"cities.plist"


//========data model keys========
	//for trip
#define WY_TRIP_VERSION				   @"wy_trip_version"
#define WY_TRIP_ORDER                  @"wy_trip_order"
#define WY_TRIP_ID					   @"wy_trip_id"
#define WY_TRIP_NAME                   @"wy_trip_name"
#define WY_TRIP_DES                    @"wy_trip_description"
#define WY_TRIP_MAIN_IMAGE_URL         @"wy_trip_main_image_url"
#define WY_TRIP_BEGIN_DATE             @"wy_trip_begin_date"
#define WY_TRIP_END_DATE               @"wy_trip_end_date"
#define WY_TRIP_CREATE_DATE			   @"wy_trip_create_date"
#define WY_TRIP_DAYS                   @"wy_trip_days"
#define WY_TRIP_ISNEW                  @"wy_trip_isnew"
#define WY_TRIP_ISDEL                  @"wy_trip_isdel"
#define WY_TRIP_UPDATE                 @"wy_trip_shouldUpdate"
#define WY_TRIP_CHANGE                 @"wy_trip_changeWhenUploding"

	//for trip day
#define WY_TRIPDAY_DAYTH               @"wy_tripday_dayth"
#define WY_TRIPDAY_SPOTS               @"wy_tripday_spots"


#define WY_SPOT_LEVEL   			   @"level"
	//for continent
#define WY_CONTINENT_ID                @"id"
#define WY_CONTINENT_PARENT_ID		   @"parent_id"
#define WY_CONTINENT_NAME              @"name"

#define WY_ASIA                        @"Asia"
#define WY_EUROPE                      @"Europe"
#define WY_NORTH_AMERICA               @"North America"
#define WY_SOUTH_AMERICA               @"South America"
#define WY_AUSTRALIA                   @"Australia"
#define WY_AFRICA                      @"Africa"
#define WY_ANTARCTICA                  @"Antarctica"

	//for country
#define WY_COUNTRY_ID				   @"id"
#define WY_COUNTRY_PARENT_ID		   @"parent_id"
#define WY_COUNTRY_NAME                @"name"

	//for city
#define WY_CITY_ID					   @"id"
#define WY_CITY_PARENT_ID			   @"parent_id"
#define WY_CITY_NAME                   @"name"

	//for spot
#define WY_SPOT_ID					   @"wy_spot_id"
#define WY_SPOT_ORDER				   @"wy_spot_order"
#define WY_SPOT_NAME                   @"wy_spot_name"
#define WY_SPOT_ADDRESS                @"wy_spot_address"
#define WY_SPOT_INFO                   @"wy_spot_info"
#define WY_SPOT_WEBSITE_ARR            @"wy_spot_website_arr"
#define WY_SPOT_IMAGE_URL_ARR          @"wy_spot_image_url_arr"
#define	WY_SPOT_CITY				   @"wy_spot_city"
#define WY_SPOT_PROVINCE			   @"wy_spot_province"
#define WY_SPOT_COUNTRY				   @"wy_spot_country"
#define WY_SPOT_CONTINENT			   @"wy_spot_continent"


//========pull & refresh========
#define REFRESH_HEADER_HEIGHT          52.0f

#endif
