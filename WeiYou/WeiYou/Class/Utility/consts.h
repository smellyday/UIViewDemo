//
//  consts.h
//  WeiYou
//
//  Created by owen on 11/19/13.
//  Copyright (c) 2013 xiyuan. All rights reserved.
//
#import "WYLog.h"
#import "consts_sys_pic.h"
#import "consts_view.h"
#import "consts_utility.h"
#import "WYNavigationController.h"

#ifndef WeiYou_consts_h
#define WeiYou_consts_h

//========one day interval=======
#define WY_DAY_INTERVAL 86400

//========main color========
#define WY_MAIN_COLOR                  [UIColor colorWithRed:0.3 green:0.4 blue:0.6 alpha:1.0]
#define WY_MAIN_COLOR_BG               [UIColor colorWithRed:0.4 green:0.5 blue:0.7 alpha:1.0]
#define WY_CELL_COLOR                  [UIColor colorWithRed:0.9531 green:0.9414 blue:0.9140 alpha:1.0]

//========LOGIN========
#define PREFIX_SINA                         @"wb"
#define PREFIX_QQ                           @"tencent"

//========SINA login info========
#define WY_USER_ID                          @"wy_user_id"
#define WY_USER_NAME                        @"wy_user_name"
#define WY_USER_PROFILE_IMAGE_URL           @"wy_user_profile_image_url"
#define WY_USER_PROFILE_IMAGE_DATA          @"wy_user_profile_image_data"
#define WY_USER_TOKEN_SINA                  @"wy_token_sina"

//========notification center========
#define WY_NOTI_CHOSEN_ARRAY_CHANGE         @"ChosenArrayChange" // for create new trip
#define WY_NOTI_TRIPS_DATA_OK               @"trips_data_ok"
#define WY_NOTI_TRIPS_SYNC_FINISH           @"trips_sync_finish"
#define WY_NOTI_SINA_LOGIN                  @"wy_sina_login"
#define WY_NOTI_SINA_LOGOUT                 @"wy_sina_logout"


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
	// ==going to delete.
//#define WY_TRIP_CONTINENTS             @"trip_continents"
//#define WY_TRIP_HOTELS                 @"trip_hotels"
//#define WY_TRIP_TRAFFICS               @"trip_traffics"
//#define WY_TRIP_DATE                   @"trip_date"

	//for continent
#define WY_CONTINENT_ID                @"wy_continent_id"
#define WY_CONTINENT_NAME              @"wy_continent_name"
#define WY_CONTINENT_DES               @"wy_continent_des"

#define WY_ASIA                        @"Asia"
#define WY_EUROPE                      @"Europe"
#define WY_NORTH_AMERICA               @"North America"
#define WY_SOUTH_AMERICA               @"South America"
#define WY_AUSTRALIA                   @"Australia"
#define WY_AFRICA                      @"Africa"
#define WY_ANTARCTICA                  @"Antarctica"

	//for country
#define WY_COUNTRY_ID				   @"wy_country_id"
#define WY_COUNTRY_NAME                @"wy_country_name"
#define WY_COUNTRY_DES                 @"wy_country_des"

	//for province
#define WY_PROVINCE_ID				   @"wy_province_id"
#define WY_PROVINCE_NAME               @"wy_province_name"
#define WY_PROVINCE_DES                @"wy_province_des"

	//for city
#define WY_CITY_ID					   @"wy_city_id"
#define WY_CITY_NAME                   @"wy_city_name"
#define WY_CITY_DES                    @"wy_city_des"

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
